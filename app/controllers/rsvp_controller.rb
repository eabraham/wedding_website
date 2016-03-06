class RsvpController < ApplicationController
  before_action :authenticate_user!, except: [:wedding_rsvp, :submit, :index]

  def index

  end

  def wedding_rsvp
  	@user = User.find_by(email: params[:email])
  	@users= [@user] + @user.children.order(:is_child)
  rescue Exception => e
    flash[:notice] = "Sorry we do not have that email, do you have another. Please contact hello@asmitaanderic.com if you need help."
    redirect_to '/'
  end

  def submit
    user = User.find_by(email: params[:email])
    if params[:password].nil?
      begin
       HTTParty.post('http://textbelt.com/text', 
                      body: { number: "9097062621",
                              message: "#{user.full_name} has RSVPed with a No."
                            }.to_json,
                            headers: { 'Content-Type' => 'application/json'}, timeout: 1)
      rescue => e
        # don't fail transaction
      end
      flash[:notice] = "Sorry you could not make the wedding. Please sign our guestbook."
      redirect_to '/guestbook/index'
      return
    end
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save

    user_ids = params.map do |p|
      match = p.to_s.match(/user-([0-9]+)-rsvp/)
      if match
        match[1]
      else
        nil
      end
    end.select(&:present?)
    rsvped = []
    user_ids.each do |user_id|
      c_user = User.find(user_id)
      c_user.full_name = params["user-#{user_id}-name"] if params["user-#{user_id}-name"].present?
      c_user.rsvp = params["user-#{user_id}-rsvp"]
      c_user.diet = params["user-#{user_id}-dr"]
      c_user.age = params["user-#{user_id}-age"]
      c_user.save!
      rsvped << user_id
    end

    begin
      HTTParty.post('http://textbelt.com/text', 
                    body: { number: "9097062621",
                            message: "#{user.full_name} has RSVPed with a Yes."
                          }.to_json,
                          headers: { 'Content-Type' => 'application/json'}, timeout: 1)
    rescue => e
      # don't fail transaction
    end

    sign_in(user)
    flash[:notice] = "Thank you for your RSVP, we cannot wait to share our special day with you." if rsvped.any?
    if [:asmita_family, :asmita_family_friend].include?(current_user.group_name)
      redirect_to '/rsvp/nyc'
    else
  	  redirect_to '/'
    end
  end

  def hotel_rsvp
    @users = [current_user] + current_user.children.order(:is_child)
    @friday = [:asmita_family, :asmita_family_friend].include?(current_user.group_name)
    @saturday = [:asmita_family, :asmita_family_friend].include?(current_user.group_name)
    @sunday = @users.select { |u| u.brunch_rsvp || u.tour_rsvp || u.dinner_rsvp }.any?
  end

  def rsvp_hotel_submit
    user_ids = params.map do |p|
      match = p.to_s.match(/user-([0-9]+)-friday/)
      if match
        match[1]
      else
        nil
      end
    end.select(&:present?)
    rsvped = []
    user_ids.each do |user_id|
      c_user = User.find(user_id)
      c_user.hotel_friday = params["user-#{user_id}-friday-rsvp"]
      c_user.hotel_saturday = params["user-#{user_id}-saturday-rsvp"]
      c_user.hotel_sunday = params["user-#{user_id}-sunday-rsvp"]
      c_user.room_detail = params["room-details"]
      c_user.save!
      rsvped << user_id if c_user.hotel_friday || c_user.hotel_saturday || c_user.hotel_sunday
    end

    flash[:notice] = "RSVP complete. Thank you!"
    redirect_to :big_day_index
  end

  def nyc_rsvp
    @users = [current_user] + current_user.children.order(:is_child)
  end


  def rsvp_nyc_submit

    user_ids = params.map do |p|
      match = p.to_s.match(/user-([0-9]+)-brunch/)
      if match
        match[1]
      else
        nil
      end
    end.select(&:present?)
    rsvped = []
    user_ids.each do |user_id|
      c_user = User.find(user_id)
      c_user.brunch_rsvp = params["user-#{user_id}-brunch"]
      c_user.tour_rsvp = params["user-#{user_id}-tour"]
      c_user.dinner_rsvp = params["user-#{user_id}-dinner"]
      c_user.save!
      rsvped << user_id if c_user.brunch_rsvp || c_user.tour_rsvp || c_user.dinner_rsvp
    end
    if rsvped.any?
      flash[:notice] = "Cannot wait to see you on Sunday."
    else
      flash[:notice] = "Sorry you could not make the festivities."
    end

    redirect_to '/rsvp/hotel'    
  end
end

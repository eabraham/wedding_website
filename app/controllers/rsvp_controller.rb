class RsvpController < ApplicationController
  before_action :authenticate_user!, except: [:wedding_rsvp, :submit, :index]

  def index

  end

  def wedding_rsvp
  	user = User.find_by(email: params[:email])
  	@users= [user] + user.children
  	@token = user.invite_code
  rescue Exception => e
    flash[:notice] = "Sorry we don't have that email, do you have another. Please contact hello@ericandasmita.com if you need help."
    redirect_to '/'
  end

  def nyc_rsvp

  end

  def submit
    if params[:password].nil?
      flash[:notice] = "Sorry you could not make the wedding."
      redirect_to '/'
      return
    end
   	user = User.find_by(invite_code: params[:invite_code])
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
      c_user.rsvp = params["user-#{user_id}-rsvp"]
      c_user.diet = params["user-#{user_id}-dr"]
      c_user.age = params["user-#{user_id}-age"]
      c_user.save!
      rsvped << user_id
    end

    sign_in(user)
    if [:asmita_family_far, :asmita_family_far].include?(User::GROUP[current_user.group])
      redirect_to '/rsvp/nyc'
    else
  	  flash[:notice] = "Thank you for your RSVP, we cannot wait to share our special day with you." if rsvped.any?
  	  redirect_to '/'
    end
  end
end

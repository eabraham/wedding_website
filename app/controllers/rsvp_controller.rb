class RsvpController < ApplicationController
  before_action :authenticate_user!, except: [:rsvp, :submit, :index]

  def index

  end

  def rsvp

  	user = User.find_by(invite_code: params[:invite_code])
  	@users= [user] + user.children
  	@token = params[:invite_code]
  rescue Exception => e
    flash[:notice] = "Invalid token, please contact hello@ericandasmita.com if you need help."
    redirect_to '/'
  end

  def submit
    if params[:email].nil?
      flash[:notice] = "Sorry you could not make the wedding."
      redirect_to '/'
      return
    end
  	user = User.find_by(invite_code: params[:invite_code])
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save

  	rsvped = []
  	params.each do |param, value|
  	  match = param.match(/user-([0-9]+)-rsvp/)
      if match && value == "on"
      	child_id = match[1]
        rsvped << child_id
      end
  	end
    User.where(id: user.children.map(&:id) - rsvped).update_all(rsvp: false)
  	User.where(id: rsvped).update_all(rsvp: true)

    sign_in(user)
  	flash[:notice] = "Thank you for your RSVP, we cannot wait to share our special day with you." if rsvped.any?
  	redirect_to '/'
  end
end

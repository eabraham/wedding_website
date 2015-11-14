class RsvpController < ApplicationController
  before_action :authenticate_user!, except: [:rsvp, :submit]
  def rsvp
  	token = Devise.token_generator.digest(User, :confirmation_token, params[:token])
  	user = User.find_by_confirmation_token(token)
  	@users= [user] + user.children
  	@token = params[:token]
  end

  def submit
  	token = Devise.token_generator.digest(User, :confirmation_token, params[:user_token])
  	user = User.find_by_confirmation_token(token)
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
  	User.where(id: rsvped).update_all(rsvp: true)

  	flash[:notice] = "Sorry you could not make the wedding." if rsvped.empty?
  	flash[:notice] = "Thank you for your RSVP, we cannot wait to share our special day with you." if rsvped.any?
  	redirect_to '/'
  end
end

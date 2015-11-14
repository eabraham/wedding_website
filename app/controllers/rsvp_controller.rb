class RsvpController < ApplicationController
  before_action :authenticate_user!, except: [:rsvp]
  def rsvp
  	token = Devise.token_generator.digest(User, :confirmation_token, params[:token])
  	@user = User.find_by_confirmation_token(token)
  end
end

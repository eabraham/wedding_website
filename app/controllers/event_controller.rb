class EventController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
  	@events =  Event.order(date_start: :asc).all
  end
end

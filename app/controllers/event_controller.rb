class EventController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
    @events =  Event.includes(:images).order(date_start: :asc).all
  end
end

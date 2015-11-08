class GalleryController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
  	@images = Image.all
  end
end

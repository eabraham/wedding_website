class GalleryController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
  	@images = Image.all
  	@full_images = @images.map{|a| { href: a.photo.url, title: 'test'} }
  end
end

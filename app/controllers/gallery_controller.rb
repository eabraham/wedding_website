class GalleryController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
  	@album = Album.first
  	@images = Image.where(imageable_id: @album.id, imageable_type: 'Album')
  	@full_images = @images.map{|a| { href: a.photo.url, title: 'test'} }
  end
end

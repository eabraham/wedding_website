class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @is_welcome = true
    binding.pry
  end
end

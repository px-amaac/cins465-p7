class HomeController < ApplicationController
  before_action :correct_user, only: [ :edit, :update, :destroy ]

  def index
    @photos = Photo.all
  end
end

class PhotosController < ApplicationController
  before_action :set_photo, only: [ :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = current_user.photos.build
  end

  def create

    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Photo added"
    end
  end

  def destroy
    @photo.image = nil
    @photo.save
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def update
      respond_to do |format|
        if @photo.update(edit_photo_params)
          format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end  
  end


private
    def photo_params
      params.require(:photo).permit(:title, :image )
    end
    

    def edit_photo_params
      params.require(:photo).permit(:title )

    end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
  end

end

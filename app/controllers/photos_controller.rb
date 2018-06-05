class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy
    redirect_to request.referrer
  end

end

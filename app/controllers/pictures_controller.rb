class PicturesController < ApplicationController

  def create
    @picture = Picture.new(picture_params)
    authorize @picture
    @picture.save
    redirect_to offer_path(Offer.find(@picture.imageable_id))
  end

  private

  def picture_params
    params.require(:picture).permit(:photo, :imageable_id, :imageable_type)
  end
end

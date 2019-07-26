class OffersController < ApplicationController
  
  def show
    @offers = Offer.all
    @offer = Offer.find(params[:id])
    @messages = Message.where(offer: @offer)
    @message = Message.new
    @picture = Picture.new
  end
  
  def create_offer
    @offer = Offer.new
    @publication = Publication.find(params[:publication_id])
    @offer.user = current_user
    @offer.publication = @publication
    authorize @offer
    if @offer.save
      redirect_to offers_path
    end
  end
end

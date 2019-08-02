class OffersController < ApplicationController

  def index
    @offers = policy_scope(Offer)  
  end

  def show
    @offers = Offer.all
    @offer = Offer.find(params[:id])
    @messages = Message.where(offer: @offer)
    @message = Message.new
    @picture = Picture.new
    authorize @offer
  end
  
  def create_offer
    @offer = Offer.new
    @publication = Publication.find(params[:publication_id])
    @offer.user = current_user
    @offer.publication = @publication
    authorize @offer
    if @offer.save
      redirect_to @offer
    end
  end
end

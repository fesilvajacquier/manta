class OffersController < ApplicationController
  
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

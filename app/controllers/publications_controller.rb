class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show new create]

  def index
    @publications = policy_scope(Publication).geocoded # returns flats with coordinates

    @markers = @publications.map do |publication|
      {
        lat: publication.latitude,
        lng: publication.longitude
      }
    end
  end

  def show
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
    authorize @publication
  end
end

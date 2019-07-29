class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    if params[:search].present?
      @publications = policy_scope(Publication).search_publications(params[:search])

      @markers = @publications.map do |publication|
        {
          lat: publication.latitude,
          lng: publication.longitude
        }
      end
    else
      @publications = policy_scope(Publication).geocoded # returns flats with coordinates

      @markers = @publications.map do |publication|
          {
            lat: publication.latitude,
            lng: publication.longitude
          }
      end
    end
  end

  def show
    # @publication.pictures.build
    @picture = Picture.new
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
    authorize @publication
  end
end

class PublicationsController < ApplicationController
  def index
    if params[:search].present?
      @publications = policy_scope(Publication).search_publications(params[:search])

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
end

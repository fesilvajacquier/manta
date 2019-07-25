class PublicationsController < ApplicationController
  def index
    @publications = policy_scope(Publication).geocoded # returns flats with coordinates

    @markers = @publications.map do |publication|
      {
        lat: publication.latitude,
        lng: publication.longitude
      }
    end
  end
end

class PublicationsController < ApplicationController
  skip_before_action :authenticate_user!

 def index
  if params[:search].present?
    @publications = policy_scope(Publication).search_publications(params[:search])

  @markers = @publications.map do |publication|
    {
      lat: publication.latitude,
      lng: publication.longitude
    }

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

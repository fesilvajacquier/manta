class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.roots
    if params[:search].present?
      @publications = policy_scope(Publication).search_publications(params[:search])
      @markers = @publications.map do |publication|
        {
          lat: publication.latitude,
          lng: publication.longitude
        }
      end
      
    elsif params[:publication].present?
      status = params[:publication][:status]
      category_id = params[:publication][:category_id]
      location = params[:publication][:location]
      
      @publications = policy_scope(Publication).search_publications(params[:publication][:search])
      @publications = @publications.where(status: status.to_i) if status.present?
      @publications = @publications.where(category_id: category_id.to_i) if category_id.present?
      @publications = @publications.near(location, 10) if location.present?
    else
      @publications = policy_scope(Publication).geocoded
      @markers = @publications.map do |publication|
        {
          lat: publication.latitude,
          lng: publication.longitude
        }
      end
    end
  end
  
  def show
    @picture = Picture.new
  end
  
  private
  
  def set_publication
    @publication = Publication.find(params[:id])
    authorize @publication
  end
end

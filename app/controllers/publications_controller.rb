class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.roots
    # raise
    if params[:search].present?
      @publications = policy_scope(Publication).search_publications(params[:search])
      
      @markers = @publications.map do |publication|
        {
          lat: publication.latitude,
          lng: publication.longitude
        }
      end
      
    elsif params[:publication].present?
      # @publications = policy_scope(Publication).search_publications(params[:publication][:search]).where(status: params[:publication][:status].to_i)
      
      # status = params[:publication][:status] != "" ? "AND status LIKE :status \ " : nil
      # location = params[:publication][:location] != "" ? "AND location @@ :location \ " : nil
      # category = params[:publication][:category_id] != "" ? "AND category @@ :category" : nil
      
      # query = <<-SQL
      # title @@ :search
      # OR description @@ :search
      # OR intended_use @@ :search
      # #{status}
      # #{location}
      # #{category}
      # SQL
      
      status = params[:publication][:status] != "" ? params[:publication][:status].to_i : nil
      location = params[:publication][:location] != "" ? params[:publication][:location] : nil
      category = params[:publication][:category_id] != "" ? params[:publication][:category_id] : nil
      
      # query = "\
      # publications.title @@ :search \
      # OR publications.description @@ :search \
      # OR publications.intended_use @@ :search \
      # #{status}
      # #{location}
      # #{category}
      # "
      # byebug
      
      if status && location && category
          @publications = policy_scope(Publication).where('status = ?', status).where('category_id = ?', category).near(location, 100)
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
    @picture = Picture.new
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
    authorize @publication
  end
end

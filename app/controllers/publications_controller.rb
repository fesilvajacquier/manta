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
      
      status = params[:publication][:status] != "" ? "AND status = :status" : nil
      category = params[:publication][:category_id] != "" ? "AND category_id = :category_id" : nil
      # location = params[:publication][:location] != "" ? "AND location @@ :location \ " : nil
      location = params[:publication][:location] != "" ? params[:publication][:location] : nil
      
      @query = <<-SQL
      title @@ :search
      OR description @@ :search
      OR intended_use @@ :search
      #{status}
      #{category}
      SQL
      .squish
      
      if location
        # byebug
        @publications = policy_scope(Publication).where(@query, search: "#{params[:publication][:search]}",
          status: "#{params[:publication][:status].to_i}",
          category_id: "#{params[:publication][:category_id].to_i}").near(location, 100)
      else
          # byebug
          @publications = policy_scope(Publication).where(@query, search: "#{params[:publication][:search]}",
                                                  status: "#{params[:publication][:status].to_i}",
                                                  category_id: "#{params[:publication][:category_id].to_i}")
      end
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

# if status && location && category
#     @publications = policy_scope(Publication).where('status = ?', status).where('category_id = ?', category).near(location, 100)
# end
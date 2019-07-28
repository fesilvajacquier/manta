class Admin::PublicationsController < ApplicationController
  before_action :set_ngo, only: [:new, :create]
  before_action :set_publication, only: [:edit, :update]
  before_action :set_categories, only: [:new, :edit]

  def new
    @publication = Publication.new
    @publication.pictures.build
    authorize([:admin, @publication])
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.pictures.first.imageable_id = 1
    @publication.user = current_user
    @publication.ngo = @ngo
    authorize([:admin, @publication])
    if @publication.save
      redirect_to admin_ngo_publications_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to @publication
    else
      render :new
    end
  end

  private

  def set_ngo
    @ngo = Ngo.find(params[:ngo_id])
  end

  def set_categories
    @categories = Category.roots
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(
      :title,
      :description,
      :indended_use,
      :category,
      :subcategory,
      :location,
      :created_at,
      :updated_at,
      :closing_text,
      pictures_attributes: %i[
        picture
        imageable_id
        imageable_type
        category
      ]
    )
  end
end



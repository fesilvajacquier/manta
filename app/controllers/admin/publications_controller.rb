class Admin::PublicationsController < ApplicationController
  before_action :set_ngo, only: %i[new create]
  before_action :set_publication, only: %i[edit update]

  before_action :set_categories, only: %i[new edit create update]

  def new
    @publication = Publication.new
    @publication.pictures.build
    authorize([:admin, @publication])
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.pictures.last.picture.file.nil?
      @publication.pictures.first.destroy
    else
      @publication.pictures.first.imageable_id = 1
    end
    @publication.ngo = @ngo
    authorize([:admin, @publication])
    if @publication.save
      redirect_to @publication
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
      :intended_use,
      :category_id,
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

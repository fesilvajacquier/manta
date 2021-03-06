class NgosController < ApplicationController
  before_action :set_ngo, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    if params[:search].present?
      @ngos = policy_scope(Ngo).search_ngos(params[:search])
    else
      @ngos = policy_scope(Ngo).geocoded # returns flats with coordinates
      @markers = @ngos.map do |ngo|
        {
          lat: ngo.latitude,
          lng: ngo.longitude
        }
      end
    end
  end

  def show
    @report = Report.new
    @ngos = Ngo.find(params[:id])

    @markers = [@ngos].map do |_ngo|
      {
        lat: @ngo.latitude,
        lng: @ngo.longitude
      }
    end
  end

  def new
    @ngo = Ngo.new
    @ngo.pictures.build
    authorize @ngo
  end

  def create
    # raise
    @ngo = Ngo.new(ngo_params)
    @ngo.pictures.first.imageable_id = 1
    @ngo.pictures.first.category = 'logo'
    @ngo.user = current_user
    authorize @ngo
    if @ngo.save
      redirect_to ngo_path(@ngo)
    else
      render :new
    end
  end

  private

  def ngo_params
    params.require(:ngo).permit(
      :name,
      :address,
      :email,
      :website,
      :description,
      :bank_account,
      :user_id,
      :created_at,
      :updated_at,
      pictures_attributes: %i[
        picture
        imageable_id
        imageable_type
      ]
    )
  end

  def set_ngo
    @ngo = Ngo.find(params[:id])
    authorize @ngo
  end
end

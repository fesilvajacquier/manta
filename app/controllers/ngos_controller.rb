class NgosController < ApplicationController
  before_action :set_ngo, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show new create]

  def show
    @report = Report.new
    @ngos = Ngo.geocoded # returns flats with coordinates

    @markers = @ngos.map do |ngo|
      {
        lat: ngo.latitude,
        lng: ngo.longitude
      }
    end
  end

  def new
    @ngo = Ngo.new
    @ngo.pictures.build
    authorize @ngo
  end

  def create
    @ngo = Ngo.new(ngo_params)
    @ngo.pictures.first.imageable_id = 1
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
<<<<<<< HEAD
    params.require(:ngo).permit(:name, :address, :email, :website,
                                :description, :bank_account, :user_id, :created_at, :updated_at)
=======
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
>>>>>>> master
  end

  def set_ngo
    @ngo = Ngo.find(params[:id])
    authorize @ngo
  end
end

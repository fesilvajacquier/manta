class NgosController < ApplicationController
  before_action :set_ngo, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show]

  def show
  end

  def new
    @ngo = Ngo.new
  end

  def create
    @ngo = Ngo.new(ngo_params)
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
    params.require(:ngo).permit(:name, :address, :email, :website, :description, :bank_account, :user_id, :created_at, :updated_at)
  end

  def set_ngo
    @ngo = Ngo.find(params[:id])
    authorize @ngo
  end
end

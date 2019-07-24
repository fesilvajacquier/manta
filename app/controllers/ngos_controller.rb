class NgosController < ApplicationController
  before_action :set_ngo, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[show]

  def show
  end

  private

  def set_ngo
    @ngo = Ngo.find(params[:id])
    authorize @ngo
  end
end

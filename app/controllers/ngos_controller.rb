class NgosController < ApplicationController
  def show
    @ngo = Ngo.find(params[:id])
  end
end

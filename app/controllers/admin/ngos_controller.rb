class Admin::NgosController < ApplicationController

  def show
    @ngo = Ngo.find(params[:id])
    authorize([:admin, @ngo])
  end
end

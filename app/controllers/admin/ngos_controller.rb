class Admin::NgosController < ApplicationController

  def show
    @picture = Picture.new
    @ngo = Ngo.find(params[:id])
    authorize([:admin, @ngo])
  end
end

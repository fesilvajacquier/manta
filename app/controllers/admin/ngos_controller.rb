class Admin::NgosController < ApplicationController
  def show
    @picture = Picture.new
    @ngo = Ngo.find(params[:id])
    @ngo_member = NgoMember.new
    @ngo_members = @ngo.ngo_members
    authorize([:admin, @ngo])
  end
end

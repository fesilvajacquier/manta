class NgoMembersController < ApplicationController

  def create
    @Ngo = Ngo.find(params[:ngo_id])
    @NgoMember = NgoMember.new(NgoMember_params)
    @Ngomember.ngo = @Ngo
  end

  def NgoMember_params
    params.require(:NgoMember).permit()
end

class Admin::NgoMembersController < ApplicationController
  before_action :set_ngo, only: %i[create]

  def create
    @ngo_member = NgoMember.new(ngo_member_params)
    @ngo_member.ngo = @ngo
    if @ngo_member.save
      respond_to do |format|
        format.html { redirect_to ngos_path(@ngo) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'admin/ngo_members/new' }
        format.js
      end
    end
  end

  def destroy
    @ngo_member = NgoMember.find(params[:id])
    @ngo_member.destroy
  end

  private

  def set_ngo
    @ngo = Ngo.find(params[:ngo_id])
  end

  def ngo_member_params
    params.require(:ngo_member).permit(:user_id)
  end
end

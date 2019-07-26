class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.offer = Offer.find(params[:id])
    authorize @message
    respond_to |format|
      if @message.save
        format.json { render :show, status: :created }
      else
        format.html { render json: @message.errors, status: :unprocessable_entity }
      end
    end

    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, :identifier)
  end
end

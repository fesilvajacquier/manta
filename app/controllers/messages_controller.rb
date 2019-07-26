class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.offer = Offer.find(params[:offer_id])
    authorize @message
    respond_to do |format|
      if @message.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :identifier)
  end

end

class MessagesController < ApplicationController
  def create

    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    respond_to do |format|
      format.js
    end

    # ActionCable.server.broadcast 'messages',
    #   message: @message.to_json,
    #   conversation: @conversation.id
    # head :ok

  end
  
  private

  def message_params
    params.require(:message).permit(:user_id, :body, :is_read)
  end
end

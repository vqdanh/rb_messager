class ConversationsController < ApplicationController
	def create
   
    @conversation = Conversation.get(current_user.id, params[:user_id])
    
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js 
    end 
  end

  def close
    @conversation = Conversation.find(params[:id])
 
    session[:conversations].delete(@conversation.id)
 
    respond_to do |format|
      format.js
    end 
  end

  def read
    @conversation = Conversation.find(params[:id])
    messages = @conversation.messages.where(is_read: false).where.not(user_id: current_user.id).update_all(is_read: true)
    puts messages.to_json
    
    render :json => messages.to_json
  end

  private
 
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
 
  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end

class HomeController < ApplicationController
  def index

  	session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

    
    unReadMessage = Conversation.getUnreadMessages(current_user)
    @un_read_count = unReadMessage.size
    
  end
end

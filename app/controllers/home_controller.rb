class HomeController < ApplicationController
  def index

  	session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

    @un_read_count = 0;
    @conversations.each do |c|
    	#@unReadCount += c.messages.where(is_read: false).count   
    	urms = c.messages.where(is_read: false)
    	if urms.present?
    		@un_read_count += urms.size
    	end
    end
  end
end

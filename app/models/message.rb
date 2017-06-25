class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  def setRead(receiverId)
  	Message.where(id_read: false).update_all(id_read)
  end
end

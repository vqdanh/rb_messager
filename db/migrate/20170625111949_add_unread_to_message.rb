class AddUnreadToMessage < ActiveRecord::Migration[5.1]
  def change
  	add_column :messages, :is_read, :boolean,  default: false
  end
end

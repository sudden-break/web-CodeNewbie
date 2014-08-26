class AddImageToChats < ActiveRecord::Migration
  def change
    add_column :chats, :image, :string
  end
end

class ChangeDateTypeInChat < ActiveRecord::Migration
  def change
    remove_column :chats, :date
  end
end

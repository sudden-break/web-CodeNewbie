class AddDateToChat < ActiveRecord::Migration
  def change
    add_column :chats, :date, :date
  end
end

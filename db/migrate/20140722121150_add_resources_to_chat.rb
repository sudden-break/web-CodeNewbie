class AddResourcesToChat < ActiveRecord::Migration
  def change
    add_column :chats, :resources, :text
  end
end

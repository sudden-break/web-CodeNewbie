class AddTweetToChat < ActiveRecord::Migration
  def change
    add_column :chats, :tweet, :text
  end
end

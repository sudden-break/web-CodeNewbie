class AddFavoriteTweetsToChat < ActiveRecord::Migration
  def change
    add_column :chats, :favorie_tweets, :text
  end
end

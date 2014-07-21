class ChangeFavorieTweetsToFavoriteTweetsToChats < ActiveRecord::Migration
  def change
    rename_column :chats, :favorie_tweets, :favorite_tweets
  end
end

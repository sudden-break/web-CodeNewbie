class AddToJwPlayerIdToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :jw_player_id, :string
  end
end

class RemovePodcastReferenceFromGuest < ActiveRecord::Migration
  def change
    remove_column :guests, :podcast_id, :references
  end
end

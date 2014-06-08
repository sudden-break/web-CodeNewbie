class AddHashtagToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :hashtag, :string
  end
end

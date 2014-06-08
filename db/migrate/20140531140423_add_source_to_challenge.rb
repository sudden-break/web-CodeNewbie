class AddSourceToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :source, :text
  end
end

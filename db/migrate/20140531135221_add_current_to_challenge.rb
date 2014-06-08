class AddCurrentToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :current, :boolean
  end
end

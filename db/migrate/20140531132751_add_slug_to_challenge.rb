class AddSlugToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :slug, :string
    add_index :challenges, :slug, unique: true
  end
end

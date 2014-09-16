class AddOtherLinksToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :other_links, :string, array: true, default: []
  end
end

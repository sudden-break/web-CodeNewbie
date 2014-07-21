class AddSlugToChat < ActiveRecord::Migration
  def change
    add_column :chats, :slug, :string
  end
end

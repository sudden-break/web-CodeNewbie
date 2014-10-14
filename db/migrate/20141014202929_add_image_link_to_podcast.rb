class AddImageLinkToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :image_link, :string
  end
end

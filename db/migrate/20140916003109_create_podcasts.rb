class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.text :description
      t.datetime :published_on
      t.text :audio_link

      t.timestamps
    end
  end
end

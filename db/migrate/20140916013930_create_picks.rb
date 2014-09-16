class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :name
      t.string :link
      t.references :podcast, index: true
      t.references :guest, index: true

      t.timestamps
    end
  end
end

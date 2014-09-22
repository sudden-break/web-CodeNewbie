class CreateShowNotes < ActiveRecord::Migration
  def change
    create_table :show_notes do |t|
      t.string :link
      t.string :name
      t.references :podcast, index: true

      t.timestamps
    end
  end
end

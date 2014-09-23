class CreateShowGuests < ActiveRecord::Migration
  def change
    create_table :show_guests do |t|
      t.references :podcast, index: true
      t.references :guest, index: true

      t.timestamps
    end
  end
end

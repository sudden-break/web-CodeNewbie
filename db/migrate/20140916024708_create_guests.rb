class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :full_name
      t.string :job_title
      t.string :company
      t.text :bio
      t.string :twitter
      t.string :github
      t.string :other_links
      t.references :podcast, index: true

      t.timestamps
    end
  end
end

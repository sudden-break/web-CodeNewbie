class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :date
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end

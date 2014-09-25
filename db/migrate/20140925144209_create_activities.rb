class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :category
      t.references :content, :polymorphic => true

      t.timestamps
    end
  end
end

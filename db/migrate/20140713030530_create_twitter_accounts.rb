class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :handle
      t.integer :followers_count
      t.references :user, index: true

      t.timestamps
    end
  end
end

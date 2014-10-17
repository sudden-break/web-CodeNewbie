class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.datetime :date
      t.string :topic
      t.string :flag
      t.integer :tweet_id
      t.integer :chat_session_id
    end
    add_index :questions, :tweet_id, unique: true
  end
end

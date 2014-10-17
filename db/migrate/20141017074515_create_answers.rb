class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.datetime :date
      t.string :topic
      t.string :flag
      t.integer :tweet_id
      t.integer :question_id
      t.string :author
    end
    add_index :answers, :tweet_id, unique: true
  end
end

class CreateChatSessions < ActiveRecord::Migration
  def change
    create_table :chat_sessions do |t|
      t.string :week
      t.datetime :start_date
    end
  end
end

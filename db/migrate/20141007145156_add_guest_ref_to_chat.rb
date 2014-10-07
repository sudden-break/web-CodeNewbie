class AddGuestRefToChat < ActiveRecord::Migration
  def change
    add_reference :chats, :guest, index: true
  end
end

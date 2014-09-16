class AddGuestRefToPick < ActiveRecord::Migration
  def change
    add_reference :picks, :guest, index: true
  end
end

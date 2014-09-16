class Pick < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :guest
  belongs_to :author, :class_name => Guest, :foreign_key => "guest_id"

end

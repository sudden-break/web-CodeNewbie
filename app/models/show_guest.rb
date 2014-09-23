class ShowGuest < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :guest
end

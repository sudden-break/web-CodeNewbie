class Challenge < ActiveRecord::Base
  extend FriendlyId

  friendly_id :username, :use => :slugged
end

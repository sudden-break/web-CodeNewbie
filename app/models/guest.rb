class Guest < ActiveRecord::Base
  belongs_to :podcast
  has_many :picks
  has_many :show_guests
end

class Guest < ActiveRecord::Base
  has_many :picks
  has_many :show_guests
  has_many :podcasts, through: :show_guests
end

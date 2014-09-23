class Podcast < ActiveRecord::Base
  validates :name, presence: true

  has_many :show_guests
  has_many :guests, through: :show_guests

  has_many :picks
  has_many :show_notes

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
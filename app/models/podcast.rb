class Podcast < ActiveRecord::Base
  validates :name, :published_on, :audio_link, presence: true

  has_many :guests
  has_many :picks
  has_many :show_notes

  extend FriendlyId
  friendly_id :name, :use => :slugged
end
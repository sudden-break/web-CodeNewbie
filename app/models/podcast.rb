class Podcast < ActiveRecord::Base
  validates :name, :published_on, :audio_link, presence: true

  extend FriendlyId
  friendly_id :name, :use => :slugged
end
class Podcast < ActiveRecord::Base
  validates :name, presence: true

  has_many :show_guests
  has_many :guests, through: :show_guests

  has_many :picks
  has_many :show_notes

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def self.create_with_guest(params)
    podcast = Podcast.new(params[:podcast])
    if podcast.save
      binding.pry
      guest = Guest.new(params[:guest])
      if guest.save
        ShowGuest.create([
          {:podcast => podcast, :guest => guest},
          {:podcast => podcast, :guest => Guest.find_by(:full_name => "Saron Yitbarek")},
        ])
      else
        return guest.error.full_message.join(". ")
      end
      return podcast
    else
      return podcast.error.full_message.join(". ")
    end
  end

end
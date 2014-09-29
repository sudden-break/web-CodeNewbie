class Podcast < ActiveRecord::Base
  validates :name, presence: true

  has_many :show_guests
  has_many :guests, through: :show_guests

  has_many :picks
  has_many :show_notes

  has_many :activities, as: :content, dependent: :destroy

  after_create :add_activity

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def self.create_with_guest(params)
    podcast = Podcast.new(params[:podcast])
    if podcast.save
      guest = Guest.sanitize_and_create(params[:guest])
      if guest.save
        ShowGuest.create([
          {:podcast => podcast, :guest => guest},
          {:podcast => podcast, :guest => Guest.find_by(:full_name => "Saron Yitbarek")},
        ])
      else
        return guest.errors.full_messages.join(". ")
      end
      return podcast
    else
      return podcast.errors.full_messages.join(". ")
    end
  end

  private

  def add_activity
    Activity.create(:content => self, :category => "podcast")
  end

end
class Chat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :activities, as: :content, dependent: :destroy

  after_create :add_activity

  private 

  def add_activity
    Activity.create(:content => self, :category => "blog")
  end

end

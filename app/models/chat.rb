class Chat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :activities, as: :content, dependent: :destroy
  belongs_to :author, :class_name => "Guest", :foreign_key => "guest_id"

  after_create :add_activity

  private 

  def add_activity
    Activity.create(:content => self, :category => "blog")
  end

end

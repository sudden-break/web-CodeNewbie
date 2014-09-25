class Chat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  after_create :add_activity

  private 

  def add_activity
    Activity.create(:content => self, :category => "podcast")
  end

end

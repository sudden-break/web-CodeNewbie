class PagesController < ApplicationController

  def index
    @next_wednesday = Time.now.wday == 3 ? Chronic.parse("today") : Chronic.parse("this Wednesday")
    @challenge = Challenge.find_by(:current => true)
    @chat = Chat.order("date DESC").first

    @activity = Activity.all.order(:created_at).limit(20).includes(:content)
  end

  def chat
    
  end

  def beta
  end

end

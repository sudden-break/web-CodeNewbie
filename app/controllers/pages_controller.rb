class PagesController < ApplicationController

  def index
    @next_wednesday = Time.now.wday == 3 ? Chronic.parse("today") : Chronic.parse("this Wednesday")
    @challenge = Challenge.find_by(:current => true)
    @chat = Chat.order("date DESC").first
    @episodes = Podcast.limit(3).order("episode_number DESC")
    @activity = Activity.all.includes(:content).sort_by{ |activity| activity.content.created_at }.reverse!
  end

  def chat
  end

  def beta
  end

  def get_involved
  end

end

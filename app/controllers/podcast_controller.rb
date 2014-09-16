class PodcastController < ApplicationController

  def index
    @episodes = Podcast.all
  end

end

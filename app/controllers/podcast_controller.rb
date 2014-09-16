class PodcastController < ApplicationController

  def index
    @episodes = Podcast.all
  end

  def show
    @episode = Podcast.friendly.find(params[:slug])
  end

end

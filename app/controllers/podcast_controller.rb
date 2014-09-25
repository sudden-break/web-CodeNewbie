class PodcastController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @episodes = Podcast.all
  end

  def new
    @episode = Podcast.new
  end

  def create
    @episode = Podcast.create_with_guest(podcast_info)
    if @episode.save
      redirect_to new_podcast_pick_path(@episode)
    else
      redirect_to new_podcast_path
    end
  end

  def show
    @episode = Podcast.friendly.find(params[:slug])
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :description, :published_on, :audio_link, :jw_player_id)
  end

  def guest_params
    params.require(:guest).permit(:first_name, :full_name, :job_title, :company, :bio, :twitter, :github, :other_links => [])
  end 

  def podcast_info
    {
      podcast: podcast_params,
      guest: guest_params
    }
  end

end

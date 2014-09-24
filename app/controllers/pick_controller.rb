class PickController < ApplicationController

  def new
    @picks = Podcast.friendly.find(params[:slug]).picks
    @pick = Pick.new
  end

  def create
    @pick = Pick.new(pick_params.merge(:podcast_id => Podcast.friendly.find(params[:podcast]).id))
    unless @pick.save
      flash[:notice] = "Pick didn't save."
    end

    redirect_to new_podcast_pick_path(params[:podcast])
  end

  private

  def pick_params
    params.require(:pick).permit(:name, :link, :guest_id)
  end

end

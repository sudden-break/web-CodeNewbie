class PickController < ApplicationController

  def new
    @pick = Pick.new
  end

  def create
    @picks = Pick.all
    @pick = Pick.new(pick_params)

    unless @pick.save
      flash[:notice] = "Pick didn't save."
    end

    redirect_to new_podcast_pick_path(Podcast.friendly.find(params[:pick][:podcast_id]))
  end

  private

  def pick_params
    params.require(:pick).permit(:name, :link, :guest_id, :podcast_id)
  end

end

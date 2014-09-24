class ShowNoteController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def new
    @show_notes = Podcast.friendly.find(params[:slug]).show_notes
    @show_note = ShowNote.new
  end

  def create
    @show_note = ShowNote.new(show_notes_params.merge(:podcast_id => Podcast.friendly.find(params[:podcast]).id))

    unless @show_note.save
      flash[:notice] = "Show note didn't save."
    end
    redirect_to new_show_note_path(params[:podcast])
  end

  private

  def show_notes_params
    params.require(:show_note).permit(:name, :link)
  end

end

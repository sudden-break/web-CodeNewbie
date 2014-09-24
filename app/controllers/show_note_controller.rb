class ShowNoteController < ApplicationController

  def new
    @show_notes = ShowNote.all
    @show_note = ShowNote.new
  end

  def create
    @show_note = ShowNote.new(show_notes_params)

    unless @show_note.save
      flash[:notice] = "Show note didn't save."
    end

    redirect_to new_show_note_path(params[:show_note][:podcast_id])
  end

  private

  def show_notes_params
    params.require(:show_note).permit(:name, :link, :podcast_id)
  end

end

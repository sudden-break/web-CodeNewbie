class ShowNoteController < ApplicationController

  def new
    @show_notes = ShowNote.all
    @show_note = ShowNote.new
  end

  def create
    @show_note = ShowNote.new
    
    unless @show_note.save
      flash[:notice] = "Show note didn't save."
    end

    redirect_to new_show_note_path(params[:podcast])

  end

end

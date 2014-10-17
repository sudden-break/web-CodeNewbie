class ChatsessionsController < ApplicationController
  def show
    @chatsession =ChatSession.find(params[:id])
  end
end

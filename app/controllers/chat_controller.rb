class ChatController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chat_path(@chat)
    else
      flash[:error] = "Whoopsie daisy! Couldn't save that chat :("
      redirect_to new_chat_path
    end
  end

  def show
    @chat = Chat.friendly.find(params[:slug])
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :date, :description)
  end

end

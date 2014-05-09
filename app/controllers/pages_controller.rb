class PagesController < ApplicationController

  def index
    @next_wednesday = Chronic.parse("next Wednesday").strftime("%B %d")
  end
  
end
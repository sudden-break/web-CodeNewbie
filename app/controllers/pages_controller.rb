class PagesController < ApplicationController
  skip_before_action :authorize

  def index
    @next_wednesday = Chronic.parse("next Wednesday").strftime("%B %d")
  end
  
end
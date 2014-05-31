class ChallengesController < ApplicationController
  skip_before_action :authorize
  
  def show
    @challenge = Challenge.friendly.find(params[:slug])
  end
end

require 'spec_helper'

feature 'User can see the activity feed' do
  given!(:podcast){FactoryGirl.create(:valid_podcast, :name => "Episode 1")}
  given!(:chat){FactoryGirl.create(:chat)}

  scenario 'from the homepage' do

    pending

  end
end
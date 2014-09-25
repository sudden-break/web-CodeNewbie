require 'spec_helper'

feature 'User can see the activity feed' do
  given!(:podcast){FactoryGirl.create(:valid_podcast, :name => "Episode 1")}
  given!(:chat){FactoryGirl.create(:chat)}

  scenario 'from the homepage' do

    visit root_url

    expect(page).to have_content(podcast.name)
    expect(page).to have_content(chat.name)

    expect(page).to have_content(podcast.created_at)
    expect(page).to have_content(chat.created_at)

    expect(page).to have_content(podcast.description)
    expect(page).to have_content(chat.description)

  end
end
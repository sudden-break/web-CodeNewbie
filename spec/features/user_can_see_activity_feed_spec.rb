require 'spec_helper'

feature 'User can see the activity feed' do
  given!(:podcast){FactoryGirl.create(:valid_podcast)}
  given!(:chat){FactoryGirl.create(:chat)}

  scenario 'from the homepage' do
    visit root_url

    expect(page).to have_content(podcast.name)
    expect(page).to have_content(chat.name)

    expect(page).to have_content(podcast.submitted_at)
    expect(page).to have_content(chat.submitted_at)

    expect(page).to have_content(podcast.description)
    expect(page).to have_content(chat.description)

  end
end
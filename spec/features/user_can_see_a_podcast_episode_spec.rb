require 'spec_helper'

feature 'User can see a podcast episode' do
  given!(:podcast){FactoryGirl.create(:valid_podcast)}

  scenario 'with direct link' do
    visit podcast_path(podcast)

    expect(page).to have_content("Podcast")
    expect(page).to have_content(podcast.name)
    expect(page).to have_link(podcast.name, href: podcast_path(podcast))
    expect(page).to have_content(podcast.description)
    
    expect(page).to have_content(podcast.guests.first.full_name)
    expect(page).to have_content(podcast.guests.first.bio)

    expect(page).to have_link(podcast.picks.first.name)
    expect(page).to have_link(podcast.picks.first.guest.first_name)

  end
end

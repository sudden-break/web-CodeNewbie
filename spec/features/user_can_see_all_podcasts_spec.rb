require 'spec_helper'

feature 'User can see all podcasts' do
  given!(:podcast){FactoryGirl.create(:valid_podcast)}

  scenario 'with direct link' do
    visit podcasts

    expect(page).to have_content("Podcast")
    expect(page).to have_content(podcast.name)
    expect(page).to have_link(podcast_path(podcast))
    expect(page).to have_content(podcast.description)

  end
end

require 'spec_helper'

feature 'User can see a podcast episode' do
  given!(:podcast){FactoryGirl.create(:valid_podcast)}
  given!(:guest){FactoryGirl.create(:valid_guest, podcast: podcast)}
  given!(:show_note){FactoryGirl.create(:valid_show_note, podcast: podcast, :link => "http://google.com")}

  scenario 'with direct link' do
    guest.other_links = ["hi"]
    guest.save
    Pick.create(link: "link", name: "pick", podcast: podcast, guest: guest)

    visit podcast_path(podcast)

    expect(page).to have_content("Podcast")
    expect(page).to have_content(podcast.name)
    expect(page).to have_content(podcast.name)
    expect(page).to have_content(podcast.description)
    
    expect(page).to have_content(podcast.guests.first.full_name)
    expect(page).to have_content(podcast.guests.first.bio)

    expect(page).to have_link(podcast.picks.first.name)
    expect(page).to have_content(podcast.picks.first.guest.first_name)

    expect(page).to have_content(podcast.show_notes.first.name)
    expect(page).to have_content(podcast.show_notes.first.link)

  end
end

require 'spec_helper'

feature "Admin can add a new podcast" do 
  before(:each){stub_const('ENV', {'PW' => 'password'})}
  given!(:saron){Guest.create(:full_name => "Saron Yitbarek")}
   
  scenario "but not when there's a wrong password" do
    sign_up_as_admin_with("wrong-password") 
    visit new_podcast_path

    expect(current_path).to eq(root_path) 
    expect(page).to have_content("Unauthorized access")
  end

  scenario "when logged in successfully" do 
    sign_up_as_admin_with("password")
    expect(page).to have_content("Yea gurl!")

    visit new_podcast_path
    fill_in("podcast_name", with: "Episode 1")
    fill_in("podcast_description", with: "Best podcast ever.")
    fill_in("podcast_published_on", with: "Sept 4")
    fill_in("podcast_audio_link", with: "http://podcast.mp3")
    fill_in("podcast_jw_player_id", with: "123")
    
    fill_in("guest_first_name", with: "Carlos")
    fill_in("guest_full_name", with: "Carlos Lazo")
    fill_in("guest_job_title", with: "Developer")
    fill_in("guest_company", with: "Time Inc.")
    fill_in("guest_bio", with: "I'm a developer.")
    fill_in("guest_twitter", with: "@carlos_plus_plus")
    fill_in("guest_github", with: "carlos_plus_plus")
    fill_in("guest_other_links_", with: "http://personal_site.com")

    click_button("Create")

    expect(current_path).to eq(new_podcast_pick_path(Podcast.find_by(:name => "Episode 1")))

    fill_in("pick_name", with: "Traffic Lights")
    fill_in("pick_link", with: "http://link.com")
    select("Carlos", :from => "pick_guest_id")

    click_button("Add Pick")
    expect(current_path).to eq(new_podcast_pick_path(Podcast.find_by(:name => "Episode 1")))

    fill_in("pick_name", with: "Vim Adventures")
    fill_in("pick_link", with: "http://link.com")
    select("Saron Yitbarek", :from => "pick_guest_id")

    click_button("Add Pick")
    expect(current_path).to eq(new_podcast_pick_path(Podcast.find_by(:name => "Episode 1")))

    expect(page).to have_content("View Podcast")
    expect(page).to have_content("Add Show Links")

    click_link("Add Show Links")

    expect(current_path).to eq(new_show_note_path(Podcast.find_by(:name => "Episode 1")))

    fill_in("show_note_name", with: "Traffic Lights")
    fill_in("show_note_link", with: "http://link.com")
    click_button("Add Show Link")
    expect(current_path).to eq(new_show_note_path(Podcast.find_by(:name => "Episode 1")))

    fill_in("show_note_name", with: "Traffic Lights")
    fill_in("show_note_link", with: "http://link.com")
    click_button("Add Show Link")
    expect(current_path).to eq(new_show_note_path(Podcast.find_by(:name => "Episode 1")))

    expect(page).to have_content("View Podcast")
    expect(page).to have_content("Add Picks")

    click_link("View Podcast")
    expect(current_path).to eq(podcast_path(Podcast.find_by(:name => "Episode 1")))

  end

end






require 'spec_helper'

describe Guest do
  describe "attributes" do 
    let(:guest){ Guest.new }

    it "has show_guests" do 
      guest.show_guests << ShowGuest.new
      expect(guest.show_guests.last).to be_a(ShowGuest)
    end

    it "has podcasts" do 
      podcast = Podcast.create(:name => "podcasty")
      ShowGuest.create(:guest => guest, :podcast => podcast)
      expect(guest.podcasts.last).to eq(podcast)
    end
  end

  describe ".sanitize_and_make" do 
    it "sanitizes guest info and makes a new Guest" do 
      guest_params = {
        first_name: "Saron",
        other_links: ["", "http://hello.com"]
      }

      guest = Guest.sanitize_and_make(guest_params)
      expect(guest.other_links).to eq(["http://hello.com"])
    end
  end

end

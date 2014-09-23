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
end

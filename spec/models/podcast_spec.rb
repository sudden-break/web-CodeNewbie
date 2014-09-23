require 'spec_helper'

describe Podcast do
  describe "attributes" do
    let!(:podcast){FactoryGirl.create(:valid_podcast)} 

    it "has a description" do 
      podcast.description = "hello"
      expect(podcast.description).to eq("hello")
    end

    it "is invalid without a name" do
      podcast.name = nil
      expect(podcast).to be_invalid
    end

    it "has a jw_player_id" do 
      podcast.jw_player_id = "123"
      expect(podcast.jw_player_id).to eq("123")
    end

    it "has show_guests" do 
      podcast.show_guests << ShowGuest.new
      expect(podcast.show_guests.last).to be_a(ShowGuest)
    end

    it "has show_guests" do 
      guest = Guest.create
      ShowGuest.create(:guest => guest, :podcast => podcast)
      expect(podcast.guests.last).to eq(guest)
    end

  end
end

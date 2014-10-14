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

    it "has an image link" do 
      podcast.image_link = "/images/pic.png"
      expect(podcast.image_link).to eq("/images/pic.png")
    end

    it "has an episode number" do 
      podcast.episode_number = 1
      expect(podcast.episode_number).to eq(1)
    end

  end

  describe "#create_with_guest" do 

    let(:params){
      {
        podcast: {
          name: "Episode 1",
          description: "The best episode."
        },
        guest: {
          first_name: "Carlos",
          full_name: "Carlos Lazo"
        }
      }
    }

    let!(:saron){Guest.create(:full_name => "Saron Yitbarek")}

    it "creates a new podcast with guest information" do 
      Podcast.create_with_guest(params)

      carlos = Guest.find_by(:first_name => "Carlos")

      expect(Podcast.last.name).to eq("Episode 1")
      expect(Guest.last.first_name).to eq("Carlos")
      expect(ShowGuest.where(:podcast => Podcast.last)).to include(ShowGuest.find_by(:guest => carlos))
      expect(ShowGuest.where(:podcast => Podcast.last)).to include(ShowGuest.find_by(:guest => saron))
    end
  end

  describe "add_activity" do 

    it "creates a new activity" do 
      podcast = Podcast.create(:name => "new podcast")
      expect(Activity.last.content).to eq(podcast)
    end

  end

end

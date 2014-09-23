require 'spec_helper'

describe ShowGuest do
  describe "attributes" do
    let(:show_guest){ ShowGuest.new }

    it "belongs to a guest" do 
      show_guest.guest = Guest.new
      expect(show_guest.guest).to be_a(Guest)
    end

    it "belongs to a podcast" do 
      show_guest.podcast = Podcast.new
      expect(show_guest.podcast).to be_a(Podcast)
    end

  end
end

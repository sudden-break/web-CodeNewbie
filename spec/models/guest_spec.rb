require 'spec_helper'

describe Guest do
  describe "attributes" do 
    let(:guest){ Guest.new }

    it "has a show_guest" do 
      guest.show_guests << ShowGuest.new
      expect(guest.show_guests.last).to be_a(ShowGuest)
    end

  end
end

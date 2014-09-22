require 'spec_helper'

describe ShowNote do
  describe "attributes" do
    let!(:show_note){FactoryGirl.create(:valid_show_note)} 

    it "has a link" do 
      show_note.link = "hello"
      expect(show_note.link).to eq("hello")
    end

    it "has a podcast" do 
      show_note.podcast = Podcast.new
      expect(show_note.podcast).not_to be_nil
    end

    it "is invalid without a name" do
      show_note.name = nil
      expect(show_note).to be_invalid
    end
  end
end

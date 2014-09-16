require 'spec_helper'

describe Pick do
  describe "attributes" do
    let!(:pick){Pick.new} 
    let!(:podcast){FactoryGirl.create(:valid_podcast)} 
    let!(:guest){FactoryGirl.create(:valid_guest)} 

    it "has a name" do 
      pick.name = "hello"
      expect(pick.name).to eq("hello")
    end

    it "has a link" do 
      pick.link = "link"
      expect(pick.link).to eq("link")
    end

    it "belongs to an episode" do
      pick.podcast = podcast
      expect(pick.podcast).to eq(podcast)
    end

    it "has an author" do 
      pick.author = guest
      expect(pick.author).to eq(guest)
    end
  end
end

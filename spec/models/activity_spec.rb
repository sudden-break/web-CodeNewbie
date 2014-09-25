require 'spec_helper'

describe Activity do
  describe "attributes" do 
    let!(:podcast){FactoryGirl.create(:valid_podcast)}

    it "belongs to a content" do 
      activity = Activity.new(:content => podcast)
      expect(activity.content).to eq(podcast)
    end

    it "has a category" do 
      activity = Activity.new(:category => "podcast")
      expect(activity.category).to eq("podcast")
    end

  end
end

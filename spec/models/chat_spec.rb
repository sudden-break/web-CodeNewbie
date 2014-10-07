require 'spec_helper'

describe Chat do

  describe "add_activity" do 
    it "creates a new activity" do 
      chat = Chat.create(:name => "Having It All")
      expect(Activity.last.content).to eq(chat)
    end
  end
  
  describe "attributes" do 
    let(:guest){ FactoryGirl.create(:valid_guest) }

    it "has an author" do 
      chat = Chat.create(:name => "Having It All", :author => guest)
      expect(chat.author).to eq(guest)
    end

  end

end

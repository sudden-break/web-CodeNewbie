require 'spec_helper'

describe Chat do

  describe "add_activity" do 
    it "creates a new activity" do 
      chat = Chat.create(:name => "Having It All")
      expect(Activity.last.content).to eq(chat)
    end
  end
  
end

require 'spec_helper'

feature "Use can see chat" do 

  scenario "by going to the chat page" do 

    visit chat_info_path

    expect(page).to have_content("Our Weekly TwitterChat")

  end

end
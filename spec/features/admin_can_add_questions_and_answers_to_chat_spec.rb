require 'spec_helper'

feature "Admin can add questions and answers to chat" do 
  before(:each){stub_const('ENV', {'PW' => 'password'})}
   
  scenario "but not when there's a wrong password" do
    sign_up_as_admin_with("wrong-password") 
    visit new_chat_path

    expect(current_path).to eq(root_path) 
    expect(page).to have_content("Unauthorized access")
  end

  scenario "when logged in successfully" do 
    sign_up_as_admin_with("password")
    expect(page).to have_content("Yea gurl!")

    visit new_chat_path
    fill_in("chat_name", with: "Code Impostor")
    fill_in("chat_date", with: "Sept 4")
    fill_in("chat_description", with: "this is a description")
    fill_in("chat_tweet", with: "this is the tweet")
    
    click_button("Create")
    expect(page).to have_content("Code Impostor")
    expect(current_path).to eq(chat_path(Chat.last))  

  end



end
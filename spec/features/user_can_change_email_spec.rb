require 'spec_helper'

feature "User can change their email" do 
  given!(:user){ FactoryGirl.create(:valid_user) }

  scenario "by visiting the correct url" do 
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit edit_email_path
    expect(page).to have_content("Email")
    fill_in("user_email", with: "email@gmail.com")
    click_button("Submit")
    expect(user.email).to eq("email@gmail.com")
  end

end
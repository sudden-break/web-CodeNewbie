require 'spec_helper'

feature "User can see getting_involved page" do 

  scenario "by going to the link" do 
    visit get_involved_path

    expect(page).to have_content("How To Get Involved")
  end
 
end
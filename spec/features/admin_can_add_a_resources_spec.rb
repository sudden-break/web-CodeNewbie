require 'spec_helper'

feature "Admin creates a new resource" do 
  before(:each){stub_const('ENV', {'PW' => 'password'})}
  
  scenario "with the right password" do 
    visit admin_path
    fill_in("password", with: "password")
    click_button("Submit")
    expect(page).to have_content("Yea gurl!")

    visit new_resource_path
    fill_in("resource_name", with: "Flatiron School")
    fill_in("resource_description", with: "Flatiron School")
    click_button("Create")
    expect(page).to have_content("Flatiron School")
    expect(current_path).to eq(resources_path) 

  end

  scenario "with the wrong password" do 
  end

end

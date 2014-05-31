require 'spec_helper'

feature 'User can see monthly challenge' do 
  before(:all){ FactoryGirl.create(:valid_challenge) }

  scenario 'from homepage' do
    visit root_path
    expect(page).to have_link('Learn More', href: "/challenges/the-commit")
    expect(page).to have_content('#theCommit')
    click_link("Learn More")
    expect(page).to have_content("June Challenge")
    expect(page).to have_content("#theCommit")
  end  

end
require 'spec_helper'

feature 'User can see monthly challenge' do 
  let(:challenge){ FactoryGirl.create(:valid_challenge, :slug => "the-commit") }

  before(:all) do 
    # Challenge.any_instance.should_return(:challenge)
  end

  scenario 'from homepage' do
    visit root_path

    expect(page).to have_content('theCommit')
    expect(page).to have_link('Learn More', href: "/challenges/the-commit")

    click_link("Learn More")

    expect(page).to have_content("June Challenge")
    expect(page).to have_content("#theCommit")
  end  
end
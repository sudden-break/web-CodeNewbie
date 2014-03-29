require 'spec_helper'

feature 'User can see homepage' do 

  scenario 'and read the about section' do
    visit root_path
    expect(page).to have_content('About')
  end  

  scenario 'and view "How Does This Work" section' do
    visit root_path
    expect(page).to have_content('How Does This Work')
  end

end
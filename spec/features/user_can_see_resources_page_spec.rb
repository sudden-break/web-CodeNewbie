require 'spec_helper'

feature 'User can see resources page' do 

  scenario 'as a user visiting the site' do
    visit resources_path
    expect(page).to have_content('Programming Resources')
  end  

end
require 'spec_helper'

feature 'User can see faqs' do 

  scenario 'as a user visiting the site' do
    visit page_path('faq')
    expect(page).to have_content('FAQ')
  end  

  scenario 'from the home page' do
    visit root_path
    click_link('FAQ')
    expect(current_path).to eq(page_path('faq'))
    expect(page).to have_content('FAQ')
  end

end
require 'spec_helper'

feature 'User can see faqs' do 

  before(:each) do
  end

  scenario "as a user visiting the site" do

    visit page_path('faq')
    expect(page).to have_content("FAQ")

  end  

end
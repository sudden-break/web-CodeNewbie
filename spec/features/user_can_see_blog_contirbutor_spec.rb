require 'spec_helper'

feature "Use can see blog author" do 
  let!(:author){ FactoryGirl.create(:valid_guest) }
  let!(:blog_post){ FactoryGirl.create(:chat, :author => author) }

  scenario "on homepage" do 
    # visit root_path
    # expect(page).to have_content("by #{author.full_name}")
  end

  scenario "on blog page" do 
    visit blog_path
    expect(page).to have_content("by #{author.full_name}")
  end


end
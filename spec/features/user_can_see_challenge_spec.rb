require 'spec_helper'

feature 'User can see monthly challenge' do
  before(:all) do
    @challenge = FactoryGirl.create(
      :valid_challenge, slug: "the-commit", hashtag: '#TheCommit')
  end

  # before(:all) do
  #   # Challenge.any_instance.should_return(:challenge)
  # end

  scenario 'from homepage' do
    visit root_path
    # => Page render is blowing up saying @challenge = nil

    expect(page).to have_content('#TheCommit')
    expect(page).to have_link('Learn More', href: "/challenges/the-commit")

    click_link("Learn More")

    expect(page).to have_content("June Challenge")
    expect(page).to have_content("#TheCommit")
  end
end

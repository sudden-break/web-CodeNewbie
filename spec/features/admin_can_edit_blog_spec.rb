require 'spec_helper'

feature "Admin can edit a blog post" do 
  before(:each){stub_const('ENV', {'PW' => 'password'})}
  let(:blog_post){FactoryGirl.create(:blog)}
   
  scenario "but not when there's a wrong password" do
  end

  scenario "when logged in successfully" do 
  end


  scenario "successfully with additional resources" do
  end

  scenario "successfully with a twitter chat" do 
  end

  scenario "successfully with a twitter chat and additional resources" do 
  end

end
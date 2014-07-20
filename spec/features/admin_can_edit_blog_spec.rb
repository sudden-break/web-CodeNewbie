require 'spec_helper'

feature "Admin can edit a blog post" do 
  before(:each){stub_const('ENV', {'PW' => 'password'})}
   
  scenario "but not when there's a wrong password" do
    sign_up_as_admin_with("wrong-password") 
    visit new_blog_path

    expect(current_path).to eq(root_path) 
    expect(page).to have_content("Unauthorized access")
  end

  scenario "when logged in successfully" do 
    sign_up_as_admin_with("password")
    expect(page).to have_content("Yea gurl!")

    visit new_blog_path
    fill_in("blog_title", with: "Code Impostor, updated")
    fill_in("blog_body", with: "Flatiron School, updated")
    fill_in("blog_excerpt", with: "this is the excerpt, updated")
    fill_in("blog_tag_list", with: "impostor, updated")
    
    click_button("Create")
    expect(page).to have_content("Code Impostor")
    expect(current_path).to eq(blog_path(Blog.last))  
  end


  scenario "successfully with additional resources" do
  end

  scenario "successfully with a twitter chat" do 
  end

  scenario "successfully with a twitter chat and additional resources" do 
  end

end
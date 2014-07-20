module Features
  module SessionHelpers
    def sign_up_as_admin_with(password)
      visit admin_path
      fill_in("password", with: password)
      click_button("Submit")
    end
  end
end
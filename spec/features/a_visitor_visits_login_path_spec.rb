require 'rails_helper'

#As a visitor when I visit login_path
#I see a button to sign in with google
#I click the button
#I am redirected to the googles sign in page

describe "visitor" do 
  context "visits login path" do
    scenario "they see a login card with a button to log in" do
      visit login_path

      expect(page).to have_content("WorkaDay")
      expect(page).to have_content("Log In")
      expect(page).to have_button("SIGN IN WITH GOOGLE")
    end
  end
end


require 'rails_helper'

describe 'user' do
  context 'already logged in' do
    scenario 'they log out' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_on "Logout"

      expect(current_path).to be(login_path)
      expect(page).to have_content("Login or Create Account")
      expect(page).to_not have_content("Logout")
    end
  end
end

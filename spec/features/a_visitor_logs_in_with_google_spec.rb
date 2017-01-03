require 'rails_helper'

describe 'visitor' do
  before(:each) do
    Capybara.app = Workaday::Application
    stub_omniauth
  end

  context 'google login' do
    scenario 'they click login and are redirected' do
      visit root_path

      expect(status).to eq(200)
      expect(current_path).to eq(login_path)
      
      click_on "Login or Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Frank")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end

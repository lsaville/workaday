require 'rails_helper'

describe 'visitor' do
  before(:each) do
    include Capybara::DSL
    Capybara.app = Workaday::Application
    stub_omniauth
  end

  context 'google login' do
    scenario 'they click login and are redirected' do
      visit root_path

      click_on "Login or Create Account"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(login_path)

      click_on "Sign In With Google"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Frank")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '543243',
      info: {
              name: 'Frank Gonzalez',
              email: 'frank@example.com',
              image: 'https://robohash.org/dssgds'
            },
      credentials: {
                    token: 'blahblah',
                    expires_at: 3285252
                   }
    })
  end
end

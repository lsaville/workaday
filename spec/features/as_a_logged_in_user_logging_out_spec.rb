require 'rails_helper'

describe 'user' do
  context 'already logged in' do
    scenario 'they log out' do
      stub_omniauth
      visit login_path
      click_on "Sign In With Google"

      click_on "Logout"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sign In With Google")
      expect(page).to have_content("Login or Create Account")
      expect(page).to_not have_content("Logout")
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

require 'rails_helper'

RSpec.describe User, type: :model do
  context '#from_omni_auth' do
    it 'creates a user from an auth hash' do

      auth_hash = OmniAuth::AuthHash.new({ 
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

      user = User.from_omniauth(auth_hash)

      expect(user.provider).to eq('google_oauth2')
      expect(user.uid).to eq('543243')
      expect(user.name).to eq('Frank Gonzalez')
      expect(user.email).to eq('frank@example.com')
      expect(user.avatar_url).to eq('https://robohash.org/dssgds')
      expect(user.oauth_token).to eq('blahblah')
      expect(user.oauth_expires_at).to eq(Time.at(3285252))
    end
  end
end

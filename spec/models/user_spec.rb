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

  context 'validations' do
    it 'validates uid' do
      user = build(:user, uid: nil)

      expect(user).to_not be_valid
    end

    it 'validates provider' do
      user = build(:user, provider: nil)

      expect(user).to_not be_valid
    end

    it 'validates name' do
      user = build(:user, name: nil)

      expect(user).to_not be_valid
    end

    it 'validates email' do
      user = build(:user, email: nil)

      expect(user).to_not be_valid
    end

    it 'validates avatar_url' do
      user = build(:user, avatar_url: nil)

      expect(user).to_not be_valid
    end

    it 'validates oauth_token' do
      user = build(:user, oauth_token: nil)

      expect(user).to_not be_valid
    end

    it 'validates oauth_token_expires_at' do
      user = build(:user, oauth_token_expires_at: nil)
      
      expect(user).to_not be_valid
    end
  end
end

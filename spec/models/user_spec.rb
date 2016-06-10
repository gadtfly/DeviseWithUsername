require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'testuser', email: 'test@example.com', password: '12345678') }

  describe 'username attribute' do
    it 'can be valid' do
      expect(user).to be_valid
    end

    it 'is invalid when blank' do
      user.username = ''
      expect(user).to_not be_valid
    end

    it 'is invalid when not unique' do
      user.save!
      other_user = User.new(email: 'test2@example.com', password: user.password, username: user.username)
      expect(other_user).to_not be_valid
    end

    # Disallowing whitespace is a design decision, up to you. Can be more or less restrictive.
    it 'is invalid when it contains whitespace' do
      user.username = 'test user'
      expect(user).to_not be_valid
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation' do
    let(:user) { create(:user, email: 'tester@test.com') }

    it 'has a first name' do
      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'has a lats name' do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'has a email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'first name between 3 and 20 characters long' do
      user.first_name = 'N'
      expect(user).not_to be_valid

      user.first_name = 'Alex' * 6
      expect(user).not_to be_valid
    end

    it 'has a last name between 3 and 20 characters long' do
      user.last_name = 'Du'
      expect(user).not_to be_valid

      user.last_name = 'Duoling' * 6
      expect(user).not_to be_valid
    end

    it 'has a email between 3 and 40 characters long' do
      user.email = 'em'
      expect(user).not_to be_valid

      user.email = 'tester@test.com' * 10
      expect(user).not_to be_valid, 'More than 40 characters'
    end

    it 'when email adress already been taken' do
      create(:user, email: 'tester@test.com')
      expect(user).to be_valid
    end
  end
end

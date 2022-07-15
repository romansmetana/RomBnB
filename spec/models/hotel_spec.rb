require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe '#validation' do
    let(:user) { create(:user) }
    let(:hotel) { create(:hotel, user_id: user.id) }

    it 'valid hotel' do
      expect(hotel).to be_valid
    end

    it 'invalid hotel' do
      hotel.name = ''
      hotel.address = ''
      hotel.description = ''
      hotel.city = ''
      hotel.user_id = ''
      expect(hotel).not_to be_valid
    end
  end
end

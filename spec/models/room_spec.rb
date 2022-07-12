require 'rails_helper'

RSpec.describe Room, type: :model do
    describe '#validation' do
        let(:user) { create(:user) }
        let(:hotel) { create(:hotel, user_id: user.id) }
        let(:room) { create(:room, hotel_id: hotel.id) } 
    
        it 'valid room' do
          expect(room).to be_valid
        end

        it "invalid room" do
            room.name = ''
            room.price = ''
            room.square = ''
            room.capacity = ''
            room.count = ''
            room.hotel_id = ''    
            expect(room).not_to be_valid
        end
        
    end
end

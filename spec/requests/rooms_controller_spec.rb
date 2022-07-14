require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user) { create(:user, owner: true) }
  before do
    sign_in(user)
  end
  let(:hotel) { create(:hotel, user_id: user.id) }
  let(:room) { create(:room, hotel_id: hotel.id) }

  describe 'GET /new' do
    it 'returns http success' do
      get :new, params: { hotel_id: hotel.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:valid_params) do
      { room: { name: 'For two person', price: '130.00', square: '50', capacity: '2', count: '5', double_bed: '1' },
        hotel_id: hotel.id }
    end
    let(:invalid_params) do
      { room: { name: '', price: '', square: '', capacity: '', count: '', double_bed: '' },
        hotel_id: hotel.id }
    end
    it 'created success' do
      post :create, params: valid_params
      expect(response).to have_http_status(302)
    end

    it 'creation failed' do
      post :create, params: invalid_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_hotel_room_path)
    end
  end

  describe 'GET /update' do
    let(:params) { { room: { name: 'For married' }, hotel_id: hotel.id, id: room.id } }

    it 'updated success' do
      put :update, params: params

      room.reload
      expect(room.name).to eq('For married')
      expect(response).to redirect_to(root_path)
    end

    context 'when update is fail' do
      let(:invalid_params) { { room: { name: '' }, hotel_id: hotel.id, id: room.id } }

      it 'updated success' do
        put :update, params: invalid_params

        room.reload
        expect(room.name).to eq(room.name)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET /destory' do
    it 'destroed success' do
      delete :destroy, params: { hotel_id: hotel.id, id: room.id }

      expect(response).to have_http_status(204)
    end
  end
end

require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  let(:user) { create(:user) }
  before do
    sign_in(user)
  end
  let(:hotel) { create(:hotel, user_id: user.id) }
  let(:room) { create(:room, hotel_id: hotel.id) }

  let(:reservation) { create(:resrvation, user_id: user.id, room_id: room.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    before do
      session[:reservation_id] = reservation.id
    end
    it 'session - true' do
      post :create
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(reservations_path)
    end
    context 'session - nil' do
      before do
        session[:reservation_id] = nil
      end
      let(:params) { { user_id: user.id, room_id: room.id } }
      it 'creation success' do
        post :create, params: params
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET /destory' do
    it 'destroed success' do
      delete :destroy, params: { id: reservation.id }

      expect(response).to have_http_status(302)
    end
  end
end

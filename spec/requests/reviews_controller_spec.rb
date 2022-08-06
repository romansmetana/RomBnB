require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_owner) { create(:user, email: 'owner@gmail.com', owner: true) }
  before { sign_in(user) }

  let(:hotel) { create(:hotel, user_id: user_owner.id) }
  let(:room) { create(:room, hotel_id: hotel.id) }
  let(:reservation) { create(:reservation, room_id: room.id, user_id: user.id) }
  let(:review) { create(:review) }

  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:params) do
      { review:
        { comment: 'Hiltonojoppo',
          rating: 4,
          user_id: user.id,
          room_id: room.id } }
    end
    let(:invalid_params) do
      { review:
        { comment: 'Hilvartonojoppo',
          rating: nil } }
    end
    it 'creates success' do
      post :create, params: params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
    it 'creation failed' do
      post :create, params: invalid_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end
end

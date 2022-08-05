require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:user_owner) { create(:user, owner: true) }
  before { sign_in(user_owner) }
  let(:hotel) { create(:hotel, user_id: user_owner.id) }
  let(:room) { create(:room, hotel_id: hotel.id) }
  let(:review) { create(:review, user_id: user_owner.id, room_id: room.id) }

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
          user_id: user_owner.id,
          room_id: room.id } }
    end
    let(:invalid_params) { { hotel: { comment: '', rating: '', user_id: nil, room_id: nil } } }
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

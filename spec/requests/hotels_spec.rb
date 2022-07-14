require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  let(:user) { create(:user) }
  let(:hotel) { create(:hotel, user_id: user.id) }
  let(:room) { create(:room, hotel_id: hotel.id) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/hotels/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/hotels/show'
      expect(response).to have_http_status(:success)
    end
  end
end

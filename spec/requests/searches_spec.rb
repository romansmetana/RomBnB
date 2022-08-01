require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:user) { create(:user, owner: true) }
  before { sign_in(user) }
  let(:hotel) { create(:hotel, user_id: user.id) }
  let(:search) { create(:search) }

  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:params) do
      { search:
        { name: 'Hilton' } }
    end
    it 'creates success' do
      post :create, params: params
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get :show, params: { id: search.id }
      expect(response).to have_http_status(:success)
    end
  end
end

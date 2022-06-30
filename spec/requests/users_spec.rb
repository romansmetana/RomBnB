require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/users/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/users/update'
      expect(response).to have_http_status(:success)
    end
  end
end

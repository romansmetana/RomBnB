require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  let(:user) { create(:user, owner: true) }
  before do
    sign_in(user)
  end
  let(:hotel) { create(:hotel, user_id: user.id) }
  
  describe 'GET /index' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show/id' do
    it 'returns http success' do
      get :show, params: { id: hotel.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'created success' do
      post :create, params: {:hotel => {:name => 'Prha Lviv', :address => 'Levandivka', :description => 'The best hotle in Lviv', :city => 'Praha', :user_id => user.id}}
            expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it 'creation failed' do
      post :create, params: {:hotel => {:name => '', :address => '', :description => '', :city => '', :user_id => user.id}}
            expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_hotel_path)
    end
  end

  describe 'GET /update' do
    let(:params) { { hotel: { name: 'Praha'}, id: hotel.id } }

    it 'updated success' do
      put :update, params: params

      hotel.reload
      expect(hotel.name).to eq('Praha')
      expect(response).to redirect_to(edit_hotel_path(hotel))
    end

    context 'when update is fail' do
      let(:params) { { hotel: { name: ''}, id: hotel.id } }

      it 'update failed' do
        put :update, params: params

        hotel.reload
        expect(hotel.name).to eq(hotel.name)
        expect(response).to redirect_to(edit_hotel_path(hotel))
      end
    end
  end

  describe 'GET /destory' do
    it 'destroed success' do
      delete :destroy, params: { id: hotel.id }

      expect(response).to have_http_status(204)
    end
  end

end

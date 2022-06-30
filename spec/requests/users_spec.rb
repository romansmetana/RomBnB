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

  describe 'GET /update' do
    let(:params) { { user: { first_name: 'Roman', email: 'roman@new.com' }, id: user.id } }
    it 'update success' do
      put :update, params: params

      user.reload
      expect(user.first_name).to eq('Roman')
      expect(user.email).to eq('roman@new.com')
      expect(response).to redirect_to(root_path)
    end
    
    context "when update is fail" do
      let(:params) { { user:{first_name: '', email: user.email} , id: user.id } }
     
      it 'update failed' do
        put :update, params: params

        user.reload
        expect(user.first_name).to eq(user.first_name)
        expect(user.email).to eq(user.email)
        expect(response).to redirect_to(edit_user_path)
      end
    end
  
  end
end

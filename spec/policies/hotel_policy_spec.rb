require 'rails_helper'

RSpec.describe HotelPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }

  shared_examples "User owner/user can/can't to do" do
    it "User can't to do" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can to do' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :create? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :update? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :destroy? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :set_main_image? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :add_images? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :destroy_img? do
    include_examples "User owner/user can/can't to do"
  end

  permissions :show? do
    it 'User can show hotel' do
      expect(subject).not_to permit(user)
    end

    it "Owner can't show hotel" do
      expect(subject).not_to permit(user_owner)
    end
  end
end

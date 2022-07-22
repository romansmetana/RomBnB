require 'rails_helper'

RSpec.describe HotelPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }

  permissions :show? do
    it 'User can show hotel' do
      expect(subject).not_to permit(user)
    end

    it "Owner can't show hotel" do
      expect(subject).not_to permit(user_owner)
    end
  end

  permissions :create? do
    it "User can't create hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can create hotel' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :update? do
    it "User can't update hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can update hotel' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :destroy? do
    it "User can't destroy hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can destroy hotel' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :set_main_image? do
    it "User can't set main image for hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can set main image for hotel' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :add_images? do
    it "User can't add images for hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can add images for hotel' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :destroy_img? do
    it "User can't destroy hotel's images" do
      expect(subject).not_to permit(user)
    end

    it "Owner can hotel's images" do
      expect(subject).to permit(user_owner)
    end
  end
end

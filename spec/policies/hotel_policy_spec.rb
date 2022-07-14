require 'rails_helper'

RSpec.describe HotelPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }

  permissions :show? do
    it 'User can show hotel' do
      expect(subject).not_to permit(user)
    end

    it "Owner can't show hotel" do
      expect(subject).not_to permit(User.new(owner: true))
    end
  end

  permissions :create? do
    it "User can't create hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can create hotel' do
      expect(subject).to permit(User.new(owner: true))
    end
  end

  permissions :update? do
    it "User can't update hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can update hotel' do
      expect(subject).to permit(User.new(owner: true))
    end
  end

  permissions :destroy? do
    it "User can't destroy hotel" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can destroy hotel' do
      expect(subject).to permit(User.new(owner: true))
    end
  end
end

require 'rails_helper'

RSpec.describe RoomPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }

  permissions :create? do
    it "User can't create room" do
      expect(subject).not_to permit(user)  
    end

    it "Owner can create room" do
      expect(subject).to permit(User.new(owner: true))  
    end
  end

  permissions :update? do
    it "User can't update room" do
      expect(subject).not_to permit(user)  
    end

    it "Owner can update room" do
      expect(subject).to permit(User.new(owner: true))  
    end
  end

  permissions :destroy? do
    it "User can't destroy room" do
      expect(subject).not_to permit(user)  
    end

    it "Owner can destroy room" do
      expect(subject).to permit(User.new(owner: true))  
    end
  end
end

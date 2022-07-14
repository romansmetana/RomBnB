require 'rails_helper'

RSpec.describe ResrvationPolicy, type: :policy do
  subject { described_class }

  let(:user) { User.new }


  permissions :create? do
    it "User can create reservation" do
      expect(subject).to permit(user)  
    end

    it "Owner can't create reservation" do
      expect(subject).not_to permit(User.new(owner: true))  
    end
  end

  permissions :destroy? do
    it "User can destroy reservation" do
      expect(subject).to permit(user)  
    end

    it "Owner can destroy reservation" do
      expect(subject).to permit(User.new(owner: true))  
    end
  end
end

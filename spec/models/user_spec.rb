require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { is_expected.to have_many :expense }    
  end

  context "Validations" do
    let(:user) { create(:user, :with_pwd) }

    it "is valid with name field" do
      expect(user).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
  end
end


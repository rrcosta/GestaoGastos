require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Validations" do
    let(:category) { create(:category) }

    it "is valid with name field" do
      expect(category).to be_valid
    end

    it { is_expected.to validate_presence_of(:descricao) }
  end
end

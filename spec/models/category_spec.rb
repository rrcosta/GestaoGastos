require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :expense }
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:descricao) }
  end
end

require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :category }    
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_presence_of(:valor) }
    it { is_expected.to validate_presence_of(:data) }
  end
end

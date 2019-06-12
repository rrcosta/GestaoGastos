require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_presence_of(:valor) }
    it { is_expected.to validate_presence_of(:data) }
  end

  context "scopes" do
    describe '.ordered' do
      let(:exp1) { create(:expense, descricao: 'Descr1') }
      let(:exp2) { create(:expense, descricao: 'Descr2') }

      xit 'returns expenses ordered by created_at desc' do
        expect{
          Expense.last(2).reverse.map(&:id)
        }.to eq[exp1.id, exp2.id]
      end

    end
  end

end

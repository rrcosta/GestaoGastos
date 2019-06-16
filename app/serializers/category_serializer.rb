class CategorySerializer < ActiveModel::Serializer
  attributes :id, :descricao

  belongs_to :expense
  class ExpenseSerializer  < ActiveModel::Serializer
    attributes :id
  end
end

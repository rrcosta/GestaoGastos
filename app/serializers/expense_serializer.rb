class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :descricao, :valor, :data

  has_many :category
  class CategorySerializer < ActiveModel::Serializer
    attributes :descricao
  end
end

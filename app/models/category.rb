class Category < ApplicationRecord
  validates :descricao, presence: true
end

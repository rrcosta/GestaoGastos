class Category < ApplicationRecord
  belongs_to :expense

  validates :descricao, presence: true
end

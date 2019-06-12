class Expense < ApplicationRecord
  belongs_to :user

  validates :descricao, presence: true
  validates :valor, presence: true
  validates :data, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end

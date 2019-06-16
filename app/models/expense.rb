class Expense < ApplicationRecord
  belongs_to :user
  has_many :category

  validates :descricao, presence: true
  validates :valor, presence: true
  validates :data, presence: true

  scope :ordered, -> { order(data: :desc) }
  scope :filter_by_date, -> (period) { where('DATE(data) = ?', period) }
end

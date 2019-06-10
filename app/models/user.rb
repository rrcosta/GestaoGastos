# Model User
class User < ApplicationRecord
  has_many :outlay
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end

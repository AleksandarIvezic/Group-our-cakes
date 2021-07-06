class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
end

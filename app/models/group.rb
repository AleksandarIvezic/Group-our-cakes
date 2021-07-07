class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :cakes

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
end

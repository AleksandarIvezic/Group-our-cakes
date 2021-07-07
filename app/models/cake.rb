class Cake < ApplicationRecord
  has_and_belongs_to_many :groups

  validates :name, presence: true 
  validates :amount, presence: true
end

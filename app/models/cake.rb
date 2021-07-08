class Cake < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: "User"

  validates :name, presence: true 
  validates :amount, presence: true
end

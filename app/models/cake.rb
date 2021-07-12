class Cake < ApplicationRecord
  has_and_belongs_to_many :groups 
  belongs_to :author, class_name: "User"

  validates :name, presence: true 
  validates :amount, presence: true

  def self.asc 
    order("cakes.created_at ASC") 
  end

  def self.desc 
    order("cakes.created_at DESC") 
  end

  def groups_by_date
    groups.order("created_at ASC")
  end
end

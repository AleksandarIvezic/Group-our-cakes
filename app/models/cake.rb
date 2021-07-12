class Cake < ApplicationRecord
  has_and_belongs_to_many :groups 
  belongs_to :author, class_name: "User"

  validates :name, presence: true 
  validates :amount, presence: true

  scope :asc, -> {order("cakes.created_at ASC")}
  scope :desc, -> {order("cakes.created_at DESC")}
  
  def groups_by_date
    groups.order("created_at ASC")
  end

  def self.count_uncategorized_cakes(uncategorized_cakes)
    @sum=0
    uncategorized_cakes.each{|cake| @sum+=cake.amount}
    @sum
  end
end

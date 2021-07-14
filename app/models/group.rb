class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cakes

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  mount_uploader :icon, IconUploader

  def self.asc
    order('groups.name ASC')
  end

  def all_cakes
    cakes.sum('amount')
  end
end

class Group < ApplicationRecord
  belongs_to :users
  has_and_belongs_to_many :cakes
  
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  mount_uploader :icon, IconUploader
end

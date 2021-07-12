class User < ApplicationRecord
  has_secure_password
  has_many :cakes, foreign_key: :author_id
  has_many :groups

  validates :name, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  def all_cakes
    cakes.sum("amount")
  end

  def uncategorized_cakes
    cakes.includes([:groups]).desc.select{ |cake| cake.groups.empty?}
  end

  def count_uncategorized_cakes
    cakes.select{ |cake| cake.groups.empty?}.count
  end

end

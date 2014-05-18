class Tag < ActiveRecord::Base
  has_and_belongs_to_many :photos
  default_scope -> { order('created_at DESC') }
  validates :value, length: { maximum: 20 }
  validates :key, length: { maximum: 20 }, uniqueness: true
end

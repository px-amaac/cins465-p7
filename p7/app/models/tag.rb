class Tag < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates :value, length: { maximum: 20 }
  validates :key, length: { maximum: 10 }
end

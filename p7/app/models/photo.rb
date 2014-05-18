class Photo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, :attachment_presence => true

  

end

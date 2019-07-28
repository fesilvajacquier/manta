class Picture < ApplicationRecord
  enum category: { logo: 0, closing: 1 }
  belongs_to :imageable, polymorphic: true
  validates_presence_of :picture, :imageable_id, :imageable_type

  mount_uploader :picture, PhotoUploader
end

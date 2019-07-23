class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates_presence_of :photo, :imageable_id, :imageable_type
end

class Publication < ApplicationRecord
  belongs_to :ngo
  has_many :offers, dependent: :destroy
  has_many :pictures, as: :imageable
  validates :ngo_id, :title, :description, :intended_use, :category, :sub_category, :location, presence: true
  validates :description, :intended_use, length: { minimum: 100 }
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  # TODO: add category validation
  # TODO add sub_category validation
end

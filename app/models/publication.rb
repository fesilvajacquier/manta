class Publication < ApplicationRecord
  belongs_to :ngo
  has_many :offers
  has_many :pictures, as: :imageable
  validates :ngo_id, :title, :description, :intended_use, :category, :sub_category, :location, presence: true
  validates :description, :intended_use, length: { minimun: 100 }
  # TODO add category validation
  # TODO add sub_category validation
end

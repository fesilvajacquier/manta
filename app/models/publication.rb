class Publication < ApplicationRecord
  belongs_to :ngo
  has_many :offers
  has_many :pictures, as: :imageable
end

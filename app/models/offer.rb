class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  has_many :messages
end

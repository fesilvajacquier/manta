class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  # belongs_to :publications_as_owner
  has_many :messages, dependent: :destroy
  has_many :pictures, as: :imageable
  validates :user_id, :publication_id, presence: true
end

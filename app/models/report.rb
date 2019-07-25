class Report < ApplicationRecord
  belongs_to :user
  belongs_to :ngo
  validates  :ngo_id, :category, :content, presence: true
  validates :content, length: { minimum: 140 }
end

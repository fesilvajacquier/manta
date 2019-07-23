class Report < ApplicationRecord
  belongs_to :user
  belongs_to :ngo
  validates :user_id, :ngo_id, :category, :content, presence: true
  validates :content, length: { minimum: 140 }
end

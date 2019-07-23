class Report < ApplicationRecord
  belongs_to :user
  belongs_to :ngo
  validates :category, :content, presence: true
  validates :content, length: { minimun: 200 }
end

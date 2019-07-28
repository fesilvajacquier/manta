class Category < ApplicationRecord
  has_ancestry
  has_many :publications
  validates :name, presence: true
end

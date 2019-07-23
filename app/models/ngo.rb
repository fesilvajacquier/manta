class Ngo < ApplicationRecord
  belongs_to :user
  has_many :publications
  has_many :offers, through: : :publications
  has_many :reports
  has_many :ngo_members
  has_many :users, through: :ngo_members
  has_many :pictures, as: :imageable
end

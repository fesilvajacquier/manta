class Ngo < ApplicationRecord
  belongs_to :user
  has_many :publications, dependent: :destroy
  has_many :offers, through: :publications
  has_many :reports, dependent: :destroy
  has_many :ngo_members, dependent: :destroy
  has_many :users, through: :ngo_members
  has_many :pictures, as: :imageable, dependent: :destroy
  validates :name, :address, :email, :website, :description, :bank_account, :user_id, presence: true
  
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/}
  validates :website, format: { with: /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/ }
end

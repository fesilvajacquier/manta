class Ngo < ApplicationRecord
  belongs_to :user
  has_many :publications, dependent: :destroy
  has_many :offers, through: :publications
  has_many :reports, dependent: :destroy
  has_many :ngo_members, dependent: :destroy
  has_many :users, through: :ngo_members
  has_many :pictures, as: :imageable, dependent: :destroy
  validates :name, :address, :email, :website, :description, :bank_account, :user_id, presence: true

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :website, format: { with: %r{[(http(s)?)://(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)} }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_ngos,
    against: [ :name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end

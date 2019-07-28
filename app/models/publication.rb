class Publication < ApplicationRecord

  belongs_to :ngo
  belongs_to :category
  has_many :offers, dependent: :destroy
  has_many :offers_as_owner, dependent: :destroy, foreign_key: 'publication_id', class_name: 'Offer'
  has_many :offers_as_collaborator, dependent: :destroy, foreign_key: 'publication_id', class_name: 'Offer'

  has_many :pictures, as: :imageable
  validates :ngo_id, :title, :description, :intended_use, :category_id, :location, presence: true
  validates :description, :intended_use, length: { minimum: 100 }
  geocoded_by :address

  # after_validation :geocode, if: :will_save_change_to_address?
  # TODO: add category validation
  include PgSearch::Model

  pg_search_scope :search_publications,
    against: [ :title, :description, :location ],
    using: {
      tsearch: { prefix: true }
    }
end

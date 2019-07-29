class Publication < ApplicationRecord
  STATUS = { open: 0, closed: 1, archived: 2 }
  enum status: STATUS
  belongs_to :ngo
  belongs_to :category
  has_many :offers, dependent: :destroy
  has_many :offers_as_owner, dependent: :destroy, foreign_key: 'publication_id', class_name: 'Offer'
  has_many :offers_as_collaborator, dependent: :destroy, foreign_key: 'publication_id', class_name: 'Offer'

  has_many :pictures, as: :imageable
  validates :ngo_id, :title, :description, :intended_use, :category_id, :location, presence: true
  validates :description, :intended_use, length: { minimum: 100 }
  geocoded_by :address
  accepts_nested_attributes_for :pictures

  after_create :send_notification_email
  # after_validation :geocode, if: :will_save_change_to_address?
  # TODO: add category validation
  include PgSearch::Model

  pg_search_scope :search_publications,
    against: {
      title: 'A',
      description: 'B',
      intended_use: 'B',
      location: 'C'
    },
    using: {
      tsearch: { prefix: true }
    }

  def send_notification_email
    PublicationMailer.with(publication: self).notification.deliver_later
  end
end

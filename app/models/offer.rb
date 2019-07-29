class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  # belongs_to :publications_as_owner
  has_many :messages, dependent: :destroy
  has_many :pictures, as: :imageable
  validates :user_id, :publication_id, presence: true
  after_create :send_new_offer_email

  private

  def send_new_offer_email
    OfferMailer.with(offer: self).new_offer.deliver_now
  end
end

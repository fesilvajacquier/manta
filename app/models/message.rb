class Message < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :user_id, :offer_id, :content, presence: true
end

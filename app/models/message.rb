class Message < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :user_id, :offer_id, :content, :identifier, presence: true
  after_create :notified_pusher, on: :create

  def notified_pusher
    Pusher.trigger('message', 'new', self.as_json)
  end
end

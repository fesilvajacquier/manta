class Message < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :user_id, :offer_id, :content, :identifier, presence: true
  after_create :notified_pusher, on: :create

  def notified_pusher
    json = as_json
    json["avatar"] = user.avatar
    json["fullName"] = user.full_name
    Pusher.trigger('message', 'new', json)
  end
end

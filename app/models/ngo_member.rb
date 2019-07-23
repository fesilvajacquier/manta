class NgoMember < ApplicationRecord
  belongs_to :user
  belongs_to :ngo
  validates :user_id, :ngo_id, presence: true
end

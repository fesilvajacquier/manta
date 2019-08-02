class Report < ApplicationRecord
  REP_CAT = ['Scam', 'Spam', 'Hate speech or symbols', 'Violence or threat of violence', 'Harassment or bullying', 'Sale or promote', 'Nudity or pornography']
  belongs_to :ngo
  validates  :ngo_id, :category, :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :category, inclusion: { in: REP_CAT }

end

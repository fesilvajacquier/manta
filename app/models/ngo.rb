class Ngo < ApplicationRecord
  belongs_to :user
  has_many :publications
  has_many :offers, through: :publications
  has_many :reports
  has_many :ngo_members
  has_many :users, through: :ngo_members
  has_many :pictures, as: :imageable
  validates :name, :address, :email, :website, :description, :bank_account, :user_id, presence: true
  
  validates :email, format: { with: /^(?:(?:[\w`~!#$%^&*\-=+;:{}'|,?\/]+(?:(?:\.(?:"(?:\\?[\w`~!#$%^&*\-=+;:{}'|,?\/\.()<>\[\] @]|\\"|\\\\)*"|[\w`~!#$%^&*\-=+;:{}'|,?\/]+))*\.[\w`~!#$%^&*\-=+;:{}'|,?\/]+)?)|(?:"(?:\\?[\w`~!#$%^&*\-=+;:{}'|,?\/\.()<>\[\] @]|\\"|\\\\)+"))@(?:[a-zA-Z\d\-]+(?:\.[a-zA-Z\d\-]+)*|\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])$/}
end

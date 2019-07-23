class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ngos
  has_many :reports
  has_many :ngo_members, dependent: :destroy
  has_many :offers
  has_many :messages
  has_many :pictures, as: :imageable

end

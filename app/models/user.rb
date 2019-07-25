class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :ngos
  has_many :reports
  has_many :ngo_members, dependent: :destroy
  has_many :offers
  has_many :messages
  has_many :pictures, as: :imageable

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.email = auth.info.email
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def avatar
    if token.present?
      response = URI.open("https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{token}").read
      return JSON.parse(response)["picture"]
    else
      return "https://thesocietypages.org/socimages/files/2009/05/vimeo.jpg"
    end
  end
end

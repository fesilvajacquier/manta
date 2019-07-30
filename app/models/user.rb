class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  after_create :send_welcome_email, :subscribe_to_newsletter

  has_many :ngos_as_owner, dependent: :destroy, foreign_key: 'user_id', class_name: 'Ngo'

  has_many :ngo_members, dependent: :destroy
  has_many :ngos_as_collaborator, through: :ngo_members, source: :ngo, dependent: :destroy

  # has_many :offers_as_donor, foreign_key: 'user_id', class_name: 'Offer', dependent: :destroy
  has_many :offers_as_donor, foreign_key: 'user_id', class_name: 'Offer', dependent: :destroy

  has_many :publications_as_owner, through: :ngos_as_owner, source: :publications
  has_many :offers_as_owner, through: :publications_as_owner, source: :offers_as_owner

  has_many :publications_as_collaborator, through: :ngos_as_collaborator, source: :publications_as_collaborator
  has_many :offers_as_collaborator, through: :publications_as_collaborator, source: :offers_as_collaborator

  has_many :messages
  has_many :pictures, as: :imageable
  has_many :reports

  # alias_method :analias, :publications_as_owner
  # class<<self
  # end

  # DONE offers_as_owner
  # offers_as_collaborator
  # DONE offers_as_donor

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

  def identifier
    # if (first_name).nil?
    email
    # else
    #   return "#{first_name.capitalize}"
    # end
  end

  # def last_offer
  #   last_offers = []
  #   last_offers += offers_as_donor.last
  #   last_offers += offers_as_owner.last
  #   last_offers += offers_as_collaborator.last
  #   unless last_offer.empty?
  #     last_offers.max_by do |offer|
  #       offer.created_at
  #     end
  #   else
  #     nil
  #   end
  # end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end

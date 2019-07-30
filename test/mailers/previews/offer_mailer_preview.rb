# Preview all emails at http://localhost:3000/rails/mailers/offer_mailer
class OfferMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/offer_mailer/newoffer
  def newoffer
    OfferMailer.newoffer
  end

end

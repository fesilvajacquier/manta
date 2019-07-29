class OfferMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.offer_mailer.newoffer.subject
  #
  def new_offer
    @greeting = "You have a new offer"
    @offer = params[:offer] # Instance variable => available in view
    mail(to: @offer.publication.ngo.email, subject: "New offer published")
    # This will render a view in `app/views/user_mailer`!
  end
end

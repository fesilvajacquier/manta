class PublicationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.publication_mailer.notification.subject
  #
  def notification
    @greeting = "You have a new publication"
    @ngo = params[:publication].ngo # Instance variable => available in view
    mail(to: @ngo.email, subject: "new publication")
    # This will render a view in `app/views/user_mailer`!
  end
end

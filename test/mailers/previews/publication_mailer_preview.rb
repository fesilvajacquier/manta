# Preview all emails at http://localhost:3000/rails/mailers/publication_mailer
class PublicationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/publication_mailer/notification
  def notification
    PublicationMailer.with(publication: Publication.last).notification
  end

end

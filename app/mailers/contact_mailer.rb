class ContactMailer < ApplicationMailer

  layout false

  def contact_email(contact)
    @contact = contact
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "info@whatisaman.com", subject: 'Contact Email')
  end

  def team_registration_email(team_registration)
    @team_registration = team_registration
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "info@whatisaman.com", subject: 'Team Registration Email')
  end

  def advertisment_package_email(advertisment_package)
    @advertisment_package = advertisment_package
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "info@whatisaman.com", subject: 'Advertisement Package Email')
  end

  def advertisment_package_email(contact)
    @contact = contact

    @url  = 'http://bbq.whatisaman.com/'
    mail(to: @contact.email, subject: 'Mens of Doral BBQ Challenge')
  end

end

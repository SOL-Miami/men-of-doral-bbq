class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "ameji012@gmail.com", subject: 'Contact Email')
  end

  def team_registration_email(team_registration)
    @team_registration = team_registration
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "ameji012@gmail.com", subject: 'Team Registration Email')
  end

  def advertisment_package_email(advertisment_package)
    @advertisment_package = advertisment_package
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "ameji012@gmail.com", subject: 'Advertisement Package Email')
  end

end

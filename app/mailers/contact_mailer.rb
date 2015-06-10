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

  def newsletter_1_email(contact)
    @contact = contact
    @url  = 'http://bbq.whatisaman.com/'
    attachments['bbq-flyer.jpg'] = File.read('app/assets/images/bbq-flyer.jpg')
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    mail(from: "newsletter@whatisaman.com", to: @contact.email, subject: 'BBQ for Fathers, Sons, Brothers, and Uncles')
  end
  # ContactMailer.newsletter_1_email(user).deliver_now

end

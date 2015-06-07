class ContactMailer < ApplicationMailer

  layout false

  def contact_email(user)
    @user = user
    @url  = 'http://bbq.whatisaman.com/'
    mail(to: "ameji012@gmail.com", subject: 'Contact Email')
  end
  
end

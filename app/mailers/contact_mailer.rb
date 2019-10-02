class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(to: 'rachel.hawa@gmail.com',
          subject: "New Pet Roulette Contact Email")
    end
end

class ContactMailer < ApplicationMailer
    def contact_message(contact)
        @contact = contact
        mail(to: 'rachel.hawa@gmail.com',
          subject: "New Pet Roulette Contact Email")
    end
end

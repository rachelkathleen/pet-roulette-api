class PetMailer < ApplicationMailer

  def pet_email(pet)
      @pet = pet
      mail(to: @pet.recipient_email,
        cc: @pet.sender_email,
        subject: "Look at this pet!")
  end
end

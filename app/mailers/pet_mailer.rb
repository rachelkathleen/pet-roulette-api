class PetMailer < ApplicationMailer

  def pet_email(pet)
      @pet = pet
      mail(to: @pet.recipient_email,
        cc: @pet.sender_email,
        subject: (@pet.sender_name)+" sent you a pet from Pet Roulette!")
  end
end

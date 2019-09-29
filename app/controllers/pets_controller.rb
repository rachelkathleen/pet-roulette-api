class PetsController < ApplicationController
skip_before_action :verify_authenticity_token


  def new
    @pet = Pet.new
  end

  def create
    # binding.pry
    @pet = Pet.new(pet_params)
    if @pet.save
      PetMailer.pet_email(@pet).deliver_now
      redirect_to '/'
    else
      render new_pet_path
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:recipient_email, :recipient_name, :sender_email, :sender_name, :message)
  end
end

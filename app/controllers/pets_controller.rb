class PetsController < ApplicationController
skip_before_action :verify_authenticity_token
  
  def index 
    pets = Pet.All 
    render json: pets 
  end


  def new
    @pet = Pet.new
  end
  

  def create
    # binding.pry
    @pet = Pet.new(pet_params)
    if @pet.save
      PetMailer.pet_email(@pet).deliver_now
      render json: @pet
    else
      render json: {status: 500, message: 'Error creating pet'}
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:recipient_email, :recipient_name, :sender_email, :sender_name, :message, :url, :name, :photo)
  end
end

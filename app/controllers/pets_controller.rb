class PetsController < ApplicationController
skip_before_action :verify_authenticity_token
  
  def index 
    pets = Pet.all 
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

  def update
    binding.pry
    pet =  Pet.find(params[:id])
    
    if pet.update(pet_params)
        render json: pet
    else
        render json: {status: 500, message: 'Pet cannot be updated'}
    end
end

  private

  def pet_params
    params.require(:pet).permit(:recipient_email, :recipient_name, :sender_email, :sender_name, :message, :url, :name, :photo, :species, :likes, :likes)
  end
end

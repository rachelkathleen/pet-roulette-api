class ContactsController < ApplicationController
skip_before_action :verify_authenticity_token
    def index 
      contacts = Contact.All 
      render json: contacts 
    end

    def new
      @contact = Contact.new
    end
    

    def create
      binding.pry
      @contact = Contact.new(contact_params)
      if @contact.save
        ContactMailer.contact_email(@contact).deliver_now
        render json: @contact
      else
        render json: {status: 500, message: 'Error Sending Email'}
    end

    private

    def contact_params
      params.require(:contact).permit(:email, :name, :message)
    end
end

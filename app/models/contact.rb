class Contact < ApplicationRecord
    validates :name, :_email, :message, presence: true

end

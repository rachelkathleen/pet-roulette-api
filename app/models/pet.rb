class Pet < ApplicationRecord
  validates :recipient_name, :recipient_email, :sender_name, :sender_email, presence: true

end

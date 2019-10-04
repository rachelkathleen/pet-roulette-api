class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :sender_name
      t.string :recipient_name
      t.string :sender_email
      t.string :recipient_email
      t.text :message
      t.string :url
      t.string :name
      t.string :photo
      t.string :species

      t.timestamps
    end
  end
end

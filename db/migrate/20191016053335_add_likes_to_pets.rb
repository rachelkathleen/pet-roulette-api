class AddLikesToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :likes, :integer
  end
end

class RemoveSpecieAndAddSpecieAndShelterReferencesFromPets < ActiveRecord::Migration[7.1]
  def change
    remove_column :pets, :specie, :string
    add_reference :pets, :specie, null: false, foreign_key: true
    add_reference :pets, :shelter, null: false, foreign_key: true
  end
end

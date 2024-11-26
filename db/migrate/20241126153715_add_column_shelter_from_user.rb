class AddColumnShelterFromUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :shelter, foreign_key: true
  end
end

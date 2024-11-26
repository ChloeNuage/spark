class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.string :category
      t.text :description
      t.string :gender
      t.boolean :ok_cat
      t.boolean :ok_dog
      t.boolean :ok_kid
      t.boolean :affectionate
      t.text :behavior
      t.string :size
      t.text :needs
      t.text :environment

      t.timestamps
    end
  end
end

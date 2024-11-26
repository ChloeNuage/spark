class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :lifestyle, :string
    add_column :users, :remote_work, :boolean
    add_column :users, :address, :string
    add_column :users, :green_space, :string
    add_column :users, :household_size, :integer
    add_column :users, :time_for_pet, :integer
    add_column :users, :daily_walk, :boolean
    add_column :users, :pet_budget, :integer
    add_column :users, :have_children, :boolean
    add_column :users, :have_cat, :boolean
    add_column :users, :have_dog, :boolean
    add_column :users, :have_other_pet, :boolean
    add_column :users, :desciption, :text
    add_column :users, :can_adopt_dog, :boolean
    add_column :users, :can_adopt_cat, :boolean
    add_column :users, :can_adopt_nac, :boolean
  end
end

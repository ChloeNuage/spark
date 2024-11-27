class RemoveGreenSpaceAndAddHasGreenSpaceBooleanColomnFromUsersTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :green_space, :string
    add_column :users, :has_green_space, :boolean
  end
end

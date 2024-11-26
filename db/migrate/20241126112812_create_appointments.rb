class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :status
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :shelter, null: false, foreign_key: true

      t.timestamps
    end
  end
end

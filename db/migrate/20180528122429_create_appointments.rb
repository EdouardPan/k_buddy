class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :start_date
      t.date :end_date
      t.string :type
      t.text :description
      t.string :photos
      t.references :medical_professional, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

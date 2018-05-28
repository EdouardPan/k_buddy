class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :photos
      t.date :start_date
      t.date :end_date
      t.references :medical_professional, foreign_key: true

      t.timestamps
    end
  end
end

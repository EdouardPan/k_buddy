class CreateMedicalProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_professionals do |t|
      t.string :location_name
      t.string :address
      t.string :phone
      t.string :specialty
      t.string :doctor
      t.string :email

      t.timestamps
    end
  end
end

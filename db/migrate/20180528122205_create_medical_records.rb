class CreateMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_records do |t|
      t.date :record_date
      t.string :title
      t.string :photos
      t.string :type
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

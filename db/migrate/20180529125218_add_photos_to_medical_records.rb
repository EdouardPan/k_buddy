class AddPhotosToMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :medical_records, :photos
    add_column :medical_records, :photos, :json
  end
end

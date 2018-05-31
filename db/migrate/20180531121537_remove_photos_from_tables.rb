class RemovePhotosFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :photos
    remove_column :medical_records, :photos
    remove_column :prescriptions, :photos
  end
end

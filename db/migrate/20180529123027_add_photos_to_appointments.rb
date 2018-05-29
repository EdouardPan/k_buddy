class AddPhotosToAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :photos
    add_column :appointments, :photos, :json
  end
end

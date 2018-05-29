class AddPhotosToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :prescriptions, :photos
    add_column :prescriptions, :photos, :json
  end
end

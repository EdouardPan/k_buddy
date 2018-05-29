class RenameTypeinMedicalRecordtoCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :medical_records, :type, :category

  end
end

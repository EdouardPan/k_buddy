class ChangeDateFormatInPrescriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :prescriptions, :start_date, :datetime
    change_column :prescriptions, :end_date, :datetime
  end
end

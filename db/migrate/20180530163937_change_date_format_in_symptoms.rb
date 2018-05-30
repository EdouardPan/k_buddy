class ChangeDateFormatInSymptoms < ActiveRecord::Migration[5.2]
  def change
    change_column :symptoms, :start_date, :datetime
    change_column :symptoms, :end_date, :datetime
  end
end

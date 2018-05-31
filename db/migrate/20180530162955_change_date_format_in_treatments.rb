class ChangeDateFormatInTreatments < ActiveRecord::Migration[5.2]
  def change
    change_column :treatments, :take_time, :datetime
  end
end

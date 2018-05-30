class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :type, :category
  end
end

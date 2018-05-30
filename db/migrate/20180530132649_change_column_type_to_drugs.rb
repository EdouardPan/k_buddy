class ChangeColumnTypeToDrugs < ActiveRecord::Migration[5.2]
  def change
    rename_column :drugs, :type, :category
  end
end

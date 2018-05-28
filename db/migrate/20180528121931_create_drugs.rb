class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end

class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.boolean :taken
      t.date :take_time
      t.string :quantity
      t.references :prescription, foreign_key: true
      t.references :drug, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

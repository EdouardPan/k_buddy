class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :intensity
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

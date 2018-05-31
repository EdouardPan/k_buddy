class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url
      t.references :appointment, foreign_key: true
      t.references :medical_record, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end

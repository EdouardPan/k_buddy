class CreateWellbeings < ActiveRecord::Migration[5.2]
  def change
    create_table :wellbeings do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :url
      t.timestamps
    end
  end
end

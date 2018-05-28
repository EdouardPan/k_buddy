class AddStuffToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :zipcode, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :string
  end
end

class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :point, :integer
    add_column :users, :geolocation_access, :boolean
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :category, :integer
    add_column :users, :date_of_birth, :date
  end
end

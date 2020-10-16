class CreateBranchOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :branch_offices do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :partner, null: false, foreign_key: true
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end

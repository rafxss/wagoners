class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :partner, null: false, foreign_key: true
      t.string :description
      t.float :voucher
      t.integer :category
      t.string :url

      t.timestamps
    end
  end
end

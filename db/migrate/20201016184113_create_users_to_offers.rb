class CreateUsersToOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_to_offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

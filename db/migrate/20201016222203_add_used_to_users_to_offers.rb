class AddUsedToUsersToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :users_to_offers, :used, :boolean, null: false, default: false
  end
end

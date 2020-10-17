class AddCodeUsedToUsersToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :users_to_offers, :code_used, :boolean
  end
end

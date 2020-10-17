class AddCodeUsedToUsersToOffersDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users_to_offers, :code_used, :boolean, null: false, default: false
  end
end

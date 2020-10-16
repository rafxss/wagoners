class ChangesInOffers < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :used, :boolean, null: false, default: false
    remove_column :offers, :url
  end
end

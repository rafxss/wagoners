class RemoveUsedFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :used
  end
end

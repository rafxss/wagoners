class AddColumnUsedToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :used, :boolean
  end
end

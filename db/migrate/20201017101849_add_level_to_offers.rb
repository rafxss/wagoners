class AddLevelToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :level, :string
  end
end

class AddColumnToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :due_date, :date
  end
end

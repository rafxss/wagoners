class ChangeOffersToBeRelatedToABranch < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :partner_id
    add_reference :offers, :branch_office
  end
end

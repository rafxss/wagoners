class DeleteAddressFromPartners < ActiveRecord::Migration[6.0]
  def change
    remove_column :partners, :address
  end
end

class DefaultCategoryToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :category, :integer, null: 0, default: 0
  end
end

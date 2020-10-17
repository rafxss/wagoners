class PointsOfUsersDefault0 < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :point, :integer, null: 0, default: 0
  end
end

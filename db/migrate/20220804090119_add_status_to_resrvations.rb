class AddStatusToResrvations < ActiveRecord::Migration[7.0]
  def change
    add_column :resrvations, :status, :integer, default: 0
  end
end

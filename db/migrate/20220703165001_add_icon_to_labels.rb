class AddIconToLabels < ActiveRecord::Migration[7.0]
  def change
    add_column :labels, :icon, :string
  end
end

class ChangeColumnNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:hotels, :user_id, false)
  end
end

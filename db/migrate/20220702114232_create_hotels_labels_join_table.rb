class CreateHotelsLabelsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :hotels, :labels
    add_index :hotels_labels, %i[hotel_id label_id], unique: true
  end
end

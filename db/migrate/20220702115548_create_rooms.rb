class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :square
      t.integer :capacity
      t.integer :count
      t.integer :double_bed
      t.integer :single_bed
      t.belongs_to :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

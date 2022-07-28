class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :city
      t.integer :capacity
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end

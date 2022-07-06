class CreateResrvations < ActiveRecord::Migration[7.0]
  def change
    create_table :resrvations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

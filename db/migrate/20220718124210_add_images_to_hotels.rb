class AddImagesToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :images, :text, array: true
  end
end

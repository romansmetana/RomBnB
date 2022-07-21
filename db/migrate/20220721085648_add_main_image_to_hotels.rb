class AddMainImageToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :main_image, :text, array: true
  end
end

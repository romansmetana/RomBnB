class Search < ApplicationRecord
  def search_hotels
    hotels = Hotel.all
    rooms = Room.all if min_price.present? || max_price.present? || capacity.present?

    hotels = hotels.where(['name LIKE ?', "%#{name}%"]) if name.present?
    hotels = hotels.where(['city LIKE ?', "%#{city}%"]) if city.present?

    rooms = rooms.where(['capacity >= ?', capacity]) if capacity.present?
    rooms = rooms.where(['price >= ?', min_price]) if min_price.present?
    rooms = rooms.where(['price <= ?', max_price]) if max_price.present?
    return rooms if rooms

    hotels
  end
end

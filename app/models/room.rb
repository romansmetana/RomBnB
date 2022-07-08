class Room < ApplicationRecord
  belongs_to :hotel, optional: true
  has_many :reservations, dependent: :destroy
end

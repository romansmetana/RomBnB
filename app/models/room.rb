class Room < ApplicationRecord
  belongs_to :hotel, optional: true
  has_many :resrvations, dependent: :destroy
end

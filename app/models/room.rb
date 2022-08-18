class Room < ApplicationRecord
  belongs_to :hotel, optional: true
  has_many :resrvations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, length: { minimum: 1 }
  validates :price, presence: true, length: { minimum: 1 }
  validates :square, presence: true, length: { minimum: 1 }
  validates :capacity, presence: true, length: { minimum: 1 }
  validates :count, presence: true, length: { minimum: 1 }

  def active_rooms_count
    count - Resrvation.where(room_id: id, status: 0).count
  end
end

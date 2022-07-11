class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_and_belongs_to_many :labels
  belongs_to :user

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
  validates :address, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 100 }
  validates :city, presence: true, length: { minimum: 2, maximum: 30 }
end

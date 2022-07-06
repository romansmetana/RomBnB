class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_and_belongs_to_many :labels
end

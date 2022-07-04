class Hotel < ApplicationRecord
  has_many :rooms
  has_and_belongs_to_many :labels
end

class Resrvation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :active, -> { where(status: 'active') }
  scope :archived, -> { where(status: 'archived') }
  enum status: { active: 0, archived: 1 }
end

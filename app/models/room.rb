class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, :room_type, :accommodate, :bed_room, :bath_room, presence: true
end

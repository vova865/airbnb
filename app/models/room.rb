# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  home_type    :string
#  room_type    :string
#  accommodate  :integer
#  bed_room     :integer
#  bath_room    :integer
#  listing_name :string
#  summary      :text
#  address      :string
#  is_tv        :boolean
#  is_kitchen   :boolean
#  is_air       :string
#  boolean      :string
#  is_heating   :boolean
#  is_internet  :boolean
#  price        :integer
#  active       :boolean
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  latitude     :float
#  longitude    :float
#
class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, :room_type, :accommodate, :bed_room, :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length.positive?
      self.photos[0].image.url(size)
    else
      'blank.jpg'
    end
  end
end

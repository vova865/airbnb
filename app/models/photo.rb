# == Schema Information
#
# Table name: photos
#
#  id                 :bigint           not null, primary key
#  room_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
class Photo < ApplicationRecord
  belongs_to :room
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def url
    image.url(:medium)
  end
end

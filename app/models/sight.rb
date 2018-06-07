class Sight < ApplicationRecord
  attr_accessor :search

  has_many :waypoints, dependent: :destroy
  has_many :routes, through: :waypoints

  validates :name, presence: true

  geocoded_by :formatted_address
  after_validation :geocode, if: :will_save_change_to_formatted_address?

  mount_uploader :photo, PhotoUploader
end

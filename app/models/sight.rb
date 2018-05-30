class Sight < ApplicationRecord
  attr_accessor :search

  has_many :waypoints, dependent: :destroy
  has_many :routes, through: :waypoints

  validates :name, uniqueness: true, presence: true

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  mount_uploader :photo, PhotoUploader
end

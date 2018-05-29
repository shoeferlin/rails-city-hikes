class City < ApplicationRecord
  attr_accessor :search

  has_many :routes

  validates :name, uniqueness: true, presence: true

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  mount_uploader :photo, PhotoUploader

  def short_name
    name.split(",").first
  end
end

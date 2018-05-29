class City < ApplicationRecord
  attr_accessor :search

  has_many :routes

  validates :locality, uniqueness: true, presence: true

  geocoded_by :locality
  after_validation :geocode, if: :will_save_change_to_locality?

  mount_uploader :photo, PhotoUploader

  def short_name
    name.split(",").first
  end
end

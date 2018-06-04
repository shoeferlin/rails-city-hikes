class Route < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :waypoints
  has_many :sights, through: :waypoints, dependent: :destroy
  has_many :route_pictures
  accepts_nested_attributes_for :route_pictures
end

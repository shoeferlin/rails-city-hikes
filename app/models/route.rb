class Route < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :waypoints
  has_many :sights, through: :waypoints, dependent: :destroy
end

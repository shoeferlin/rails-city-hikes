class Sight < ApplicationRecord
  has_many :routes, through: :waypoints
end

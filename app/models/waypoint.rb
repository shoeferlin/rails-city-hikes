class Waypoint < ApplicationRecord
  belongs_to :route
  belongs_to :sight
end

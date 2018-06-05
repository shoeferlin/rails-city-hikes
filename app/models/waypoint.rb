class Waypoint < ApplicationRecord
  belongs_to :route
  acts_as_list scope: :route, column: :list_nr
  belongs_to :sight
end

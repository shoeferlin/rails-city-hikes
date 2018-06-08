class Route < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :waypoints, -> { order(list_nr: :asc) }
  has_many :sights, through: :waypoints, dependent: :destroy # Does this make sense
  has_many :reviews, dependent: :destroy
  has_many :route_pictures, dependent: :destroy
  has_many :reviews
  accepts_nested_attributes_for :route_pictures

  validates :city, presence: true
  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  scope :active, -> { where(public: true) }
  scope :owned_by, ->(owner) { where(user: owner) }

  def duplicate(user)
    new_route = self.dup
    new_route.user = user
    new_route.public = false
    new_route.no_exports = 0
    new_route.avg_rating = 0
    self.waypoints.each do |wp|
      new_waypoint = wp.dup
      new_waypoint.route = new_route
      new_waypoint.save
    end
    self.route_pictures.each do |p|
      @dup_p = p.dup
      @dup_p.route = new_route
      @dup_p.save
    end
    new_route.save
    return new_route
  end
end

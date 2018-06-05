class Route < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :waypoints, -> { order(list_nr: :asc) }
  has_many :sights, through: :waypoints, dependent: :destroy
  has_many :reviews
  has_many :route_pictures
  has_many :reviews
  accepts_nested_attributes_for :route_pictures

  validates :city, presence: true
  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
end

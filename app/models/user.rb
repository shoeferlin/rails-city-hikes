class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_routes, class_name: "Route"
  has_many :reviews
  has_many :hiked_routes
  has_many :user_hiked_routes, through: :hiked_routes, source: "hiked_route", foreign_key: "hiked_route_id"
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hiked_routes
  has_many :routes, through: :hiked_routes

  has_many :created_routes, class_name: 'Route'

  has_many :reviews

  validates :first_name, presence: true


  # Activate when field exists in form and discussed with team
  # validates :username, uniqueness: true, presence: true

  # to upload users' profile picture
  mount_uploader :picture_url, PhotoUploader

end

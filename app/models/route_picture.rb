class RoutePicture < ApplicationRecord
  belongs_to :route
  mount_uploader :route_picture, RoutePicturesUploader
end

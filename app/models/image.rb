class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ThumbnailUploader
end

class Spot < ActiveRecord::Base
 mount_uploader :image, ImageUploader
 has_many :postarticles, dependent: :destroy
end

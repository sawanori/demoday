class Spot < ActiveRecord::Base
 mount_uploader :image, ImageUploader
 has_many :postarticles, dependent: :destroy

 has_many :spot_votes, dependent: :destroy
 has_many :spot_voters, through: :spot_votes, source: :user
end

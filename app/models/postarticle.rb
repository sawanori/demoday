class Postarticle < ActiveRecord::Base
  mount_uploader :post_image, PostImageUploader
  belongs_to :user
  belongs_to :spot
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

end

class Event < ActiveRecord::Base
  mount_uploader :event_image, EventImageUploader
  belongs_to :user
  belongs_to :spot
  has_many :comments, dependent: :destroy
  has_many :tickets, dependent: :destroy
end

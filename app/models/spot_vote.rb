class SpotVote < ActiveRecord::Base
  belongs_to :spot
  belongs_to :user
end

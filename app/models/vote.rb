class Vote < ActiveRecord::Base
 belongs_to :postarticle
 belongs_to :user

 # validate do
 #   unless user && user.votable_for?(postarticle)
 #     errors.add(:base, :invalid)
 #   end
 # end
end

# Model for storing learning configuration of a user
#
# rohan.jha

class LearningConfiguration < ActiveRecord::Base
  scope :search_by_user, -> (user_id) { where(user_id: user_id) }
end 
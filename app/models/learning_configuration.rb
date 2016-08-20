class LearningConfiguration < ActiveRecord::Base
	# attr_accessor :user_id, :interval
	scope :search_by_user, -> (user_id) { where(user_id: user_id) }
end	
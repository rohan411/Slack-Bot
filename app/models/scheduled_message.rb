class ScheduledMessage < ActiveRecord::Base
	# attr_accessor :user_id, :topic_id, :content, :status
	before_create :set_defaults

	def set_defaults
		self.status ||= MessageStatus::INACTIVE
	end
end
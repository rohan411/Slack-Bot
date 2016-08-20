class Topic < ActiveRecord::Base
	# attr_accessor :user_id, :content, :status

	belongs_to :user
	before_create :set_defaults
	after_create :schedule_assessment

	private

	def set_defaults
		self.status ||= LearningStatus::NEW
	end

	def schedule_assessment
	end
end
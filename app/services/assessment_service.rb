class AssessmentService

	def initialize(topic)
		@topic = topic
	end

	def schedule
		intervals = get_intervals
		schedule_jobs(intervals)
	end

	def negative_response
		update_topic_status(ResponseStatus::NEGATIVE)
		remove_jobs
		schedule
	end

	def positive_response
		update_topic_status(ResponseStatus::POSITIVE)
	end

	private

	attr_accessor :topic

	def get_intervals
		LearningConfiguration.search_by_user(topic.user_id).collect { |config|
			config.interval
		}
	end

	def schedule_jobs(intervals)
		intervals = intervals.each { |interval|
			::AssessmentJob.perform_in(interval.seconds.from_now, topic.id, topic.user_id) 
		}
	end 

	def remove_jobs
		::AssessmentJob.remove_scheduled(topic.id, topic.user_id)
	end

	def update_topic_status(response_status)
		case response_status
		when ResponseStatus::NEGATIVE then
			topic.update_attributes(status: LearningStatus::NEW)
		when ResponseStatus::POSITIVE then
			upgrade_topic_status
		end
	end

	def upgrade_topic_status
		next_status = nil
		case topic.status
		when LearningStatus::NEW then
			next_status = LearningStatus::LEARNING
		when LearningStatus::LEARNING then
			next_status = LearningStatus::PROFICIENCY
		when LearningStatus::PROFICIENCY then
			next_status = LearningStatus::MASTERED
		end
		topic.update_attributes(status: next_status)	
	end
end
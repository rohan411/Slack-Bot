class AssessmentService

	def initialize(topic)
		@topic = topic
	end

	def schedule
		intervals = get_intervals
		schedule_jobs(interval)
	end

	def remove_and_reschedule
		remove_jobs
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
			AssessmentJob.perform_in(interval.seconds.from_now, topic.id) 
		}
	end 

	def remove_jobs
	end
end
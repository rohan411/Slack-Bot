class TopicService

	def initialize(user_id, content)
		@user_id = user_id
		@content = content
	end

	def create
		Topic.create(topic_details)
	end

	private 
	attr_reader :user_id, :content

	def topic_details
		{
			user_id: user_id,
			content: content
		}
	end 
end
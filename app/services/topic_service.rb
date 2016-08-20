class TopicService

	def initialize(user_id, text)
		@user_id = user_id
		@text = text
	end

	def create
		Topic.create(topic_details)
	end

	private 
	attr_reader :user_id, :text

	def topic_details
		{
			user_id: user_id,
			content: text
		}
	end 
end
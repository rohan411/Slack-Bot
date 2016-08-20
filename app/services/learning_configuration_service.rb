class LearningConfigurationService

	SECONDS_IN_DAY = 86400

	def initialize(user)
		@user = user
	end

	def create
		configs = DefaultLearningConfiguration.get_values_array
		create_config(configs)
	end

	private 

	attr_reader :user
	
	def create_config(configs)
		configs.each do |config|
			LearningConfiguration.create(user_id: user.id, interval: SECONDS_IN_DAY*config)
		end
	end
end
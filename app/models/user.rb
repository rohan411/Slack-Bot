class User < ActiveRecord::Base


	has_one :learning_configuration, dependent: :destroy
	has_many :topics, dependent: :destroy

	after_create :set_config

	def set_config
		LearningConfigurationService.new(self).create
	end

end
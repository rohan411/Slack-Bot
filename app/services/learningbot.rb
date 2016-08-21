require 'slack-ruby-client'
class Learningbot
	def initialize
		Slack.configure do |config|
		  config.token = ENV['SLACK_API_TOKEN']
		  config.logger = Logger.new(STDOUT)
		  config.logger.level = Logger::INFO
		  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
		end
		$slack_client = Slack::RealTime::Client.new
		$slack_client.start!
	end

end
require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::INFO
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

$slack_client = Slack::RealTime::Client.new

$slack_client.on :message do |data|
  MessageReaderService.new(data).read
end

$slack_client.on :close do |_data|
  puts 'Connection closing, exiting.'
end

$slack_client.on :closed do |_data|
  puts 'Connection has been disconnected.'
end
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

# $slack_client.start_async


# $slack_client.start!


# $slack_client.on :close do |_data|
#   puts 'Connection closing, exiting.'
# end

# $slack_client.on :closed do |_data|
#   puts 'Connection has been disconnected.'
# end

# # $slack_client2 = Slack::Web::Client.new

# # $slack_client.on :hello do
# #   puts "Successfully connected, welcome '#{$slack_client.self.name}' to the '#{$slack_client.team.name}' team at https://#{$slack_client.team.domain}.slack.com."
# # end

# # $slack_client.on :message do |data|
# #   puts data.user

# #   $slack_client.typing channel: data.channel

# #   case data.text
# #   	when /^*/ then
  		
# #    when 'bot hi' then
# #     $slack_client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!", as_user: true
# #   	when /^bot/ then
# #     $slack_client.web_client.chat_postMessage channel: data.channel, text: "Sorry <@#{data.user}>, what?"
# #   end
# # end


# $slack_client.start!
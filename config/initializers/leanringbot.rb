require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::INFO
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

$client = Slack::RealTime::Client.new

$client.on :close do |_data|
  puts 'Connection closing, exiting.'
end

$client.on :closed do |_data|
  puts 'Connection has been disconnected.'
end

$client.start_async

# $client.on :message do |data|
#   puts data.user

#   $client.typing channel: data.channel
#   MessageReaderService.new(data).read
# end

# $client.on :close do |_data|
#   puts 'Connection closing, exiting.'
# end

# $client.on :closed do |_data|
#   puts 'Connection has been disconnected.'
# end

# # $client2 = Slack::Web::Client.new

# # $client.on :hello do
# #   puts "Successfully connected, welcome '#{$client.self.name}' to the '#{$client.team.name}' team at https://#{$client.team.domain}.slack.com."
# # end

# # $client.on :message do |data|
# #   puts data.user

# #   $client.typing channel: data.channel

# #   case data.text
# #   	when /^*/ then
  		
# #    when 'bot hi' then
# #     $client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!", as_user: true
# #   	when /^bot/ then
# #     $client.web_client.chat_postMessage channel: data.channel, text: "Sorry <@#{data.user}>, what?"
# #   end
# # end


# $client.start!
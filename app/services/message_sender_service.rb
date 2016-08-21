# Service class for sending messages via slack bot
#
# rohan.jha

require "slack-ruby-client"

class MessageSenderService
  def initialize(topic)
    @topic = topic
    @slack_name = find_slack_name
  end

  def send
    text = generate_text
    $slack_client.web_client.chat_postMessage(
      channel: user_channel,
      as_user: true,
      text: text
    )   
  end

  private

  attr_reader :client, :topic, :slack_name

  def find_slack_name
    User.find(topic.user_id).slack_name
  end

  def user_channel 
    SlackFinderService.new({
        slack_name: slack_name, slack_client: $slack_client.web_client
    }).find_user_channel
  end

  def generate_text
    "Hey @" + slack_name + ", do you remeber the topic_id : #{topic.id}, which is : #{topic.content}?"
  end
  
end
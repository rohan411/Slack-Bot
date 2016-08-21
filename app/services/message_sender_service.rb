require "slack-ruby-client"

class MessageSenderService
    def initialize(topic)
        @topic = topic
        # configure_slack
        @slack_name = find_slack_name
    end

    def send
        text = generate_text
        $slack_client.web_client.chat_postMessage(
            channel: user_channel,
            as_user: true,
            text: text
        )   
        # create_message_entry(text)
    end

  private

  attr_reader :client, :topic, :slack_name

    def find_slack_name
        User.find(topic.user_id).slack_name
    end

    def user_channel 
        SlackFinderService.new({
            slack_name: slack_name, slack_client: $slack_client.web_client
        }).user_channel
    end

    def generate_text
        "Hey @" + slack_name + ", do you remeber the topic_id : #{topic.id}, which is : #{topic.content}"
    end

    # def create_message_entry(text)
    #     ScheduledMessageService.new.create(topic.user_id, topic.id, text)
    # end

    # def configure_slack
    #     Slack.configure do |config|
    #       config.token = ENV['SLACK_API_TOKEN']
    #     end
    # end

    # def client
    #     @client ||= Slack::Web::Client.new
    # end
end
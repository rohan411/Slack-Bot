# Service class for processing incoming slack messages
#
# rohan.jha

require "slack-ruby-client"

class MessageReaderService

  def initialize(data)
    @data = data
    @incoming_text = Slack::Messages::Formatting.unescape(data.text)
  end

  def read
    case incoming_text
    when /learning/i  then
      new_topic
    when /^yes|no/i then
      assessment_response
    end
  end

  private

  attr_reader :data, :incoming_text

  def new_topic
    slack_name = get_slack_name
    user = User.find_by_slack_name(slack_name)
    user ||= UserService.new(data).create
    topic_content = extract_content
    TopicService.new(user.id, topic_content).create if topic_content
  end

  def get_slack_name
    SlackFinderService.new({
      slack_id: data.user,
      slack_client: $slack_client.web_client
    }).get_slack_name
  end

  def assessment_response
    response = extract_response_status
    topic = Topic.find_by_id(extract_topic_id)
    if topic
      if response == MessageResponseStatus::POSITIVE
        AssessmentService.new(topic).process_positive_response
      else
        AssessmentService.new(topic).process_negative_response
      end
    end
  end

  def extract_response_status
    if incoming_text.match(/^yes/i)
      MessageResponseStatus::POSITIVE
    else
      MessageResponseStatus::NEGATIVE
    end
  end

  def extract_topic_id
    match = incoming_text.match(/[0-9].*/)
    result = match
    if match
        result = match[0].to_i
    end
    result
  end

  def extract_content
    matches = incoming_text.match(/learning(\S*) (.*)/i)
    result = matches
    if matches && matches.size > 2
      result = matches[2]
    end
    result
  end

end
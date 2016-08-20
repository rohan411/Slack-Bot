require "slack-ruby-client"

class MessageReaderService
  def initialize(data = nil)
    @data = data
  end

  def read
    case data.text
    when /learning/i  then
        new_topic
    when /yes/i then
        assessment_response('positive')
    when /no/i then
        assessment_response('negative')
    end
  end

  private

  attr_reader :data

  def new_topic
    slack_name = get_slack_name
    user = User.find_by_slack_name(slack_name)
    user ||= UserService.new(data).create
    TopicService.new(user.id, data.text).create
  end

  def get_slack_name
    SlackFinderService.new(data.user, $client.web_client).slack_name
  end

  def assessment_response(response)
      topic = Topic.first.rescue(nil)
      if response == 'positive'
        AssessmentService.new(topic).remove_and_reschedule
      else
        AssessmentService.new(topic).remove_and_reschedule
      end
  end
end
class AssessmentJob
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(topic_id, user_id)
  	topic = Topic.find(topic_id)
  	MessageSenderService.new(topic).send
  end
end
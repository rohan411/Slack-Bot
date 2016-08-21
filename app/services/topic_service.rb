# Service class for maintaining a user's topic
#
# rohan.jha

class TopicService

  def initialize(user_id, content)
    @user_id = user_id
    @content = content
  end

  def create
    begin
      Topic.create(topic_details)  
    rescue Exception => e
      Rails.logger.error e.message
    end
  end

  private 
  attr_reader :user_id, :content

  def topic_details
    {
      user_id: user_id,
      content: content
    }
  end 
  
end
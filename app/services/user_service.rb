# Service class containing methods to extract info from slack
#
# rohan.jha

class UserService
  
  def initialize(data = nil)
      @data = data
  end

  def create
    begin
      User.create(user_details)
    rescue Exception => e
      Rails.logger.error e.message
    end
  end

  private

  attr_reader :data

  def user_details
    SlackFinderService.new({
      slack_id: data.user,
      slack_client: $slack_client.web_client
    }).fetch_user_details
  end

end
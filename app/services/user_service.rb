# Service class containing methods to extract info from slack
#
# rohan.jha

class UserService
  
  def initialize(data = nil)
      @data = data
  end

  def create
    User.create(user_details)
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
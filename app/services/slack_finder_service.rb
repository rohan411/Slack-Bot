class SlackFinderService

	def initialize(params = {})
    @slack_id = params[:slack_id]
    @slack_name = params[:slack_name]
    @slack_client = params[:slack_client]
    find_user
  end

	def user_details
    result = {}
		if user
			result = {
        first_name: user.profile.first_name,
        last_name: user.profile.last_name,
        slack_name: get_slack_name,
        email_id: user.profile.email
      }
		end
    result
	end

  def get_slack_name
    user.name
  end

  def user_channel
    slack_id = user.id
    chat = slack_client.im_open(user: slack_id)
    chat.channel.id
  end

  private

  attr_reader :user, :slack_id, :slack_name, :slack_client

  def find_user
    user_identifier = nil
    if slack_id
      user_identifier = slack_id
    else
      user_identifier = '@'+slack_name
    end
    @user = slack_client.users_info(user: user_identifier).try(:user) 
  end

end
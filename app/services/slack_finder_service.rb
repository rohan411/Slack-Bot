class SlackFinderService

	def initialize(slack_id=nil, client)
    @slack_id = slack_id
    @user = client.users_info(user: slack_id).try(:user) if slack_id
  end

	def user_details
    result = {}
		if user
			result = {
        first_name: user.profile.first_name,
        last_name: user.profile.last_name,
        slack_name: slack_name,
        email_id: user.profile.email
      }
		end
    result
	end

  def slack_name
    user.name
  end

  def user_channel(slack_name)
    slack_user_id = slack_user["id"]
    chat = client.im_open(user: slack_user_id)
    chat["channel"]["id"]
  end

  private

  attr_reader :user, :client

  def slack_user
    all_slack_users.find { |user_data| user_data["name"] = slack_username }
  end

  def all_slack_users
    client.users_list["members"]
  end

end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	$slack_client.start_async
  	render json: {
  		message: "Slack Bot started"
	}, status: 200
  end
end

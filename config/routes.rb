require 'sidekiq/web'
Rails.application.routes.draw do
	mount Sidekiq::Web => '/sidekiq'

	get "/" => 'application#index'
end

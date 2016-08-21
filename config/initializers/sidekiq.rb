require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq_remove_scheduled'

redishost = ENV['REDIS_HOST']
redisport = ENV['REDIS_PORT']

SidekiqRemoveScheduled::Redis.config(host: redishost, port: redisport)
SidekiqRemoveScheduled.bind

Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://' + redishost + ':' + redisport+ '/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://' + redishost + ':' + redisport+ '/0' }
end

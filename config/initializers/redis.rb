redis_options = {
  url: ENV['BATEMAN_REDIS_URL']
}

redis_options[:db] = 1 if Rails.env.test?
$redis = Redis.current = Redis.new(redis_options)

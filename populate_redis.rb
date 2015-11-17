require 'redis'

redis = Redis.new(:url => '')
(10..30).each do |num|
  redis.set("counters:visits:Customer#0000000#{num}", rand(10..1000))
end

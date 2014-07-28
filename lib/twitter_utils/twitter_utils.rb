require 'twitter_utils/engagement'
require 'twitter_utils/messaging'

module TwitterUtils
  extend self

  CLIENT = Twitter::REST::Client.new do |config|
             config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
             config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
             config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
             config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
           end

  # Recipients for automatic Direct Messaging (in CSV format)
  DM_RECIPIENTS = 'CodeNewbies'

  # Max attempts to overcome API throttling before quitting.
  MAX_ATTEMPTS  = 3

  # Time Difference to Check Tweets
  # For example => 30.minutes, 1.hour
  TIME_DIFF     = 1.hour

  # Set Local Time Zone of Rails App
  # For US Time Zones: ActiveSupport::TimeZone.us_zones.map(&:name)
  TIME_ZONE     = ActiveSupport::TimeZone.new('Eastern Time (US & Canada)')

  #########################################
  # Shared methods across all submodules. #
  #########################################

  def current_time
    Time.now.in_time_zone(TIME_ZONE)
  end
end

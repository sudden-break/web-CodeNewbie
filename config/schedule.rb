# Load Environment Settings.
require 'active_support'
require 'yaml'

settings = YAML::load_file(
  File.join(File.dirname(File.expand_path(__FILE__)), '/application.yml')
)

# Allows for Server Time to map to Local Time.
Time.zone = settings['LOCAL_TIME_ZONE']

# Custom Variables to determine Frequency
follow_all_friends_times = 
  ['12:15am','6:15am','12:15pm','6:15pm'].collect do |time|
    Time.zone.parse(time).localtime
  end
time_diff = eval(settings['TIME_DIFF']) rescue 1.hour

# Information on Whenever Gem:
# ==> http://github.com/javan/whenever

set :output, 'logs/cron.log'

every time_diff do
  rake 'cron:send_message_on_hashtag'
end

every :day, :at => follow_all_friends_times do
  rake 'cron:follow_all_friends'
end

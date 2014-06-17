# Allows for Server Time to map to Local Time.
Time.zone = 'Eastern Time (US & Canada)'

# Custom Variables to determine task frequency.
follow_all_friends_times = 
  ['12:15am','6:15am','12:15pm','6:15pm'].collect do |time|
    Time.zone.parse(time).localtime
  end

# Information on Whenever Gem:
# ==> http://github.com/javan/whenever

set :output, 'log/cron.log'

every 30.minutes do
  rake 'cron:send_message_on_hashtag'
end

every :day, :at => follow_all_friends_times do
  rake 'cron:follow_all_friends'
end

# Find a way to pull in Figaro EnvVars w/o loading application.yaml

<<-WHENEVERTODO
# Load Environment Settings.
require 'active_support'
require 'yaml'

settings = YAML::load_file(
  File.join(File.dirname(File.expand_path(__FILE__)), '/application.yml')
)

Time.zone = settings['LOCAL_TIME_ZONE']
time_diff = eval(settings['TIME_DIFF']) rescue 1.hour

WHENEVERTODO

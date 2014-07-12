TIME_ZONE     = ActiveSupport::TimeZone.new('Eastern Time (US & Canada)')

# Helper Methods
def current_time
  Time.now.in_time_zone(TIME_ZONE)
end

def within_chat_window?
  current_time.wday == 3 && current_time.hour.between?(20,22)
end

# Cron Jobs (called from Heroku)
namespace :cron do
  desc 'Follow all Twitter friends.'
  task :follow_all_friends => :environment do
    TwitterUtils::Engagement.follow_all_friends
  end

  desc 'Send DM when hashtags are discovered.'
  task :send_message_on_hashtag => :environment do
    unless within_chat_window?
      challenge_hashtag = Challenge.where(current: true).first.hashtag
      hashtags          = "#CodeNewbie,#CodeNewbies,#{challenge_hashtag}".split(',')
      
      TwitterUtils::Messaging.send_message_on_hashtag('OR',hashtags)
    end
  end
end


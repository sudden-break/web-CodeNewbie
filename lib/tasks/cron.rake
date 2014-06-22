namespace :cron do
  desc 'Follow all Twitter friends.'
  task :follow_all_friends => :environment do
    TwitterUtils::Engagement.follow_all_friends
  end

  desc 'Send DM when hashtags are discovered.'
  task :send_message_on_hashtag => :environment do
    challenge_hashtag = Challenge.where(current: true).first.hashtag
    hashtags          = "#CodeNewbie,#{challenge_hashtag}".split(',')
    
    TwitterUtils::Messaging.send_message_on_hashtag('OR',hashtags)
  end
end

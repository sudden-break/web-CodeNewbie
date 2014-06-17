namespace :cron do
  desc 'Follow all Twitter friends.'
  task :follow_all_friends => :environment do
    TwitterUtils::follow_all_friends
  end

  desc 'Send DM when hashtags are discovered.'
  task :send_message_on_hashtag => :environment do
    hashtags = ENV['HASHTAGS'].split(',')
    TwitterUtils::send_message_on_hashtag('OR',hashtags)
  end
end

require 'twitter_utils/error_handling'

module TwitterUtils
  module Messaging
    extend self

    # Used with Heroku Scheduler / Whenever Gem to auto-send DMs when #s are used (no RTs).
    #
    # Example use as a standalone function:
    # send_message_on_hashtag(operator='OR',['#CodeNewbie','#TheCommit'])
    def send_message_on_hashtag(operator='OR',hashtags)
      now    = TwitterUtils.current_time
      date   = now.strftime("%Y-%m-%d")
      tags   = hashtags.join(" #{operator} ")

      search = CLIENT.search(hashtags.join(" #{operator} ") + " since:#{date} -rt")
      tweets = search.select { |t| in_time_diff?(now,t.attrs[:created_at]) }
      send_direct_messages(tweets) unless tweets.empty?
    end

    private

    def in_time_diff?(*times)
      times.collect { |t| t.in_time_zone(TIME_ZONE) }.inject(:-) < TIME_DIFF
    end

    def send_direct_messages(tweets)
      tweets.each do |t|
        tweet_url = "https://twitter.com/#{t.attrs[:user][:screen_name]}/status/#{t.attrs[:id]}"

        dm_text   = "Tracked HashTag was used!\n"
        dm_text  += "#{t.created_at.in_time_zone(TIME_ZONE).strftime('%m/%d/%Y at %I:%M%p.')}\n"
        dm_text  += "#{tweet_url}"
        
        DM_RECIPIENTS.split(',').each do |recipient|
          TwitterUtils.handle_rate_limiting { CLIENT.create_direct_message(recipient,dm_text) }
        end

        puts "#{TwitterUtils.current_time.strftime('%m/%d/%Y at %I:%M%p - done sending hashtag DMs!')}"
      end
    end

  end
end

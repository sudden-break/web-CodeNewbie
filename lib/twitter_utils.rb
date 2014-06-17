# Constants within file set in application.yml file!

module TwitterUtils
  extend self

  CLIENT = Twitter::REST::Client.new do |config|
             config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
             config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
             config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
             config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
           end
  DM_RECIPIENTS = ENV['DM_RECIPIENTS']
  HASHTAGS      = ENV['HASHTAGS']
  MAX_ATTEMPTS  = ENV['MAX_ATTEMPTS']
  TIME_DIFF     = eval(ENV['TIME_DIFF']) rescue 1.hour
  TIME_ZONE     = ActiveSupport::TimeZone.new(ENV['LOCAL_TIME_ZONE'])

  # Follower   => account that we are following and who is following us.
  # Friend     => account that is following us who we are not following.
  def follow_all_friends
    handle_rate_limiting { find_and_follow_friends }
  end

  # Used with Whenever Gem to auto-send DMs when hashtags are used.
  #
  # Example use as a standalone function:
  # send_message_on_hashtag(operator='OR',['#CodeNewbie','#TheCommit'])
  def send_message_on_hashtag(operator='OR',hashtags)
    now    = current_time
    date   = now.strftime("%Y-%m-%d")
    tags   = hashtags.join(" #{operator} ")

    search = CLIENT.search(hashtags.join(" #{operator} ") + " since:#{date}")
    tweets = search.select { |t| in_time_diff?(now,t.attrs[:created_at]) }
    send_direct_messages(tweets) unless tweets.empty?
  end

  private

  # "https://twitter.com/intent/user?user_id=#{user_id}"
  def find_and_follow_friends
    (CLIENT.follower_ids.to_a - CLIENT.friend_ids.to_a).each do |user_id|
      puts "Attempting to follow user with id: #{user_id}"
      CLIENT.follow(user_id) rescue 'Request already out to user. Moving on!'; next
    end

    puts "#{current_time.strftime('%m/%d/%Y at %I:%M%p - attempted to follow all friends!')}"
  end

  def current_time
    Time.now.in_time_zone(TIME_ZONE)
  end

  def in_time_diff?(*times)
    times.collect { |t| t.in_time_zone(TIME_ZONE) }.inject(:-) < TIME_DIFF
  end

  def send_direct_messages(tweets)
    tweets.each do |t|
      tweet_url = "https://twitter.com/#{t.attrs[:user][:screen_name]}/status/#{t.attrs[:id]}"

      dm_text   = "--- A tracked HashTag was used!\n"
      dm_text  += "#{t.created_at.strftime('Created on %m/%d/%Y at %I:%M%p.')}\n"
      dm_text  += "Tweet URL => #{tweet_url}"
      
      DM_RECIPIENTS.split(',').each do |recipient|
        handle_rate_limiting { CLIENT.create_direct_message(recipient,dm_text) }
      end

      puts "#{current_time.strftime('%m/%d/%Y at %I:%M%p - done sending hashtag DMs!')}"
    end
  end

  ##################
  # ERROR HANDLING #
  ##################

  # Error Handling Logic for Rate Limiting
  def handle_rate_limiting
    num_attempts = 0

    begin
      num_attempts += 1
      yield
    rescue Twitter::Error::TooManyRequests => error
      puts "Rate Limiting Reached, trying again in #{error.rate_limit.reset_in} seconds."
      if num_attempts <= MAX_ATTEMPTS
        sleep (error.rate_limit.reset_in + 15)
        retry
      else
        raise 'Exiting process, rate limit is unrecoverable.'
      end
    end
  end
end

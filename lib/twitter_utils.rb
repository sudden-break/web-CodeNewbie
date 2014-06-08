module TwitterUtils
  extend self

  CLIENT = Twitter::REST::Client.new do |config|
             config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
             config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
             config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
             config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
           end

  MAX_ATTEMPTS = 3

  # Follower   => account that we are following and who is following us.
  # Friend     => account that is following us who we are not following.
  def follow_all_friends
    handle_rate_limiting { find_and_follow_friends }
  end

  private

  # "https://twitter.com/intent/user?user_id=#{user_id}"
  def find_and_follow_friends
    (CLIENT.follower_ids.to_a - CLIENT.friend_ids.to_a).each do |user_id|
      puts "Attempting to follow user with id: #{user_id}"
      CLIENT.follow(user_id) rescue 'Request already out to user. Moving on!'; next
    end

    puts "Congratulations, you have followed or requested to follow all your friends!"
  end

  # Error Handling Logic for Rate Limiting
  def handle_rate_limiting
    num_attempts = 0

    begin
      num_attempts += 1
      yield
    rescue Twitter::Error::TooManyRequests => error
      puts "Rate Limiting Reached, trying again in #{error.rate_limit.reset_in} seconds."
      if num_attempts <= MAX_ATTEMPTS
        sleep (error.rate_limit.reset_in + 10)
        retry
      else
        raise 'Exiting process, rate limit is unrecoverable.'
      end
    end
  end
end
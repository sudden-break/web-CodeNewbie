require 'twitter_utils/error_handling'

module TwitterUtils
  module Engagement
    extend self

    # Follower   => account that we are following and who is following us.
    # Friend     => account that is following us who we are not following.
    def follow_all_friends
      TwitterUtils.handle_rate_limiting { find_and_follow_friends }
    end

    private

    def find_and_follow_friends
      (CLIENT.follower_ids.to_a - CLIENT.friend_ids.to_a).each do |user_id|
        puts "Attempting to follow user with id: #{user_id}"
        CLIENT.follow(user_id) rescue 'Request already out to user. Moving on!'; next
      end

      puts "#{TwitterUtils.current_time.strftime('%m/%d/%Y at %I:%M%p - attempted to follow all friends!')}"
    end
  end
end

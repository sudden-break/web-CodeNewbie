module TwitterUtils
  extend self
  
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

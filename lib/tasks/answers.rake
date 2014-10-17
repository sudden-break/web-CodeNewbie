namespace :answers do
  desc "Import answers from Twitter"
  task :import => :environment do
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    end
    
    @chatsessions = ChatSession.all
    
    (1..10).each do |i|
      @answers = search_answers(i.to_s)
      @answers.each do |q|
        answer = Answer.new
        answer.topic = @client.oembed(q, options = {:hide_thread => true, :omit_script => true}).html
        answer.date = q.created_at
        answer.tweet_id = q.id
        answer.flag = "A"+i.to_s+":"
        answer.author = q.user.screen_name
        @chatsessions.each do |cs|
          if ChatSession.validrange(cs).include? q.created_at.to_i
            answer.question_id = cs.questions.where('flag LIKE ?', "Q"+i.to_s+"%").first.id
          end
        end
        answer.save
      end
    end
  end
  def search_answers(nmbr)
    answers = @client.search("/'a"+nmbr+":/' exclude:retweets #codenewbie", :result_type => "recent")
  end
  
  desc "Delete all answers"
  task :delete => :environment do
    @answers = Answer.all
    @answers.destroy_all
  end
end
namespace :questions do
  desc "Import questions from Twitter"
  task :import => :environment do
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    end
    
    @chatsessions = ChatSession.all
    
    (1..10).each do |i|
      @questions = search_questions(i.to_s)
      @questions.each do |q|
        question = Question.new
        question.topic = q.text
        question.date = q.created_at
        question.tweet_id = q.id
        question.flag = q.text[0..2]
        @chatsessions.each do |cs|
          if ChatSession.validrange(cs).include? q.created_at.to_i
            question.chat_session_id = cs.id
          end
        end
        if q.in_reply_to_user_id.nil?
          question.save
        end
      end
    end
  end
  def search_questions(nmbr)
    questions = @client.search("from:@codenewbies /'q"+nmbr+":/' exclude:retweets -a1", :result_type => "recent")
  end
  
  desc "Delete all questions"
  task :delete => :environment do
    @questions = Question.all
    @questions.destroy_all
  end
end
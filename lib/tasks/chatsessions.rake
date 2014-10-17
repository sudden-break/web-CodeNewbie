namespace :chatsessions do
  desc "Add new session"
  task :add => :environment do
    chatsession = ChatSession.new
    if DateTime.now.wday == 4 && DateTime.now.hour.between?(01,03)
      chatsession.start_date = DateTime.now
      chatsession.week = DateTime.now.cweek
      chatsession.save
    end
  end
  desc "Delete all sessions"
  task :delete => :environment do
    chatsessions = ChatSession.all
    chatsessions.destroy_all
  end
end
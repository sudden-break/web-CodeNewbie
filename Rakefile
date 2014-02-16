require 'sinatra/activerecord/rake'
require './app'

Dir.glob('lib/tasks/*.rake').each { |r| load r }

if Sinatra::Base.development? || Sinatra::Base.test?
	require 'rspec/core/rake_task'
	
	RSpec::Core::RakeTask.new(:spec)
	task :default => :spec
end
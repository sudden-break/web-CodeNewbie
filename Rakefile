require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require './app'

# Include all rake tasks located in lib/tasks folder.
Dir.glob('lib/tasks/*.rake').each { |r| load r }

# Set default Rake task to run RSpec tests.
RSpec::Core::RakeTask.new(:spec)
task :default => :spec
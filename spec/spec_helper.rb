require File.join(File.expand_path(File.dirname(__FILE__)), '/../app.rb')

require 'sinatra'
require 'rack/test'

# Setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  AppName::App 
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
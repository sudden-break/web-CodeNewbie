source 'https://rubygems.org'
ruby '2.1.0'

gem 'sinatra'								# Core Sinatra library.
gem 'sinatra-contrib'				# Allow for Reloader.

gem 'activerecord'					# ActiveRecord capability.
gem 'sinatra-activerecord'
gem 'sinatra-flash'					# Sinatra flash capability.
gem 'sinatra-redirect-with-flash'

gem 'rake'

group :development, :test do
	gem 'sqlite3'							# SQLite3 in development.
	gem 'tux'									# CLI for models / methods.

	gem 'better_errors'				# Better error output.
	gem 'binding_of_caller'		# CLI error output.
	gem 'pry-debugger'				# Ruby debugger.
  
  gem 'capybara'						# Integration testing.
  gem 'factory_girl'				# Test tool for factories.
	gem 'rspec'								# Ruby testing framework.
end

group :production do
	gem 'pg'									# PostgreSQL in production.
end
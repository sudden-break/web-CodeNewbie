require 'sinatra'
require 'sinatra/activerecord'

require_relative 'environment'

require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

module CodeNewbie
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    set :javascripts, [:jquery]

    get '/' do
      erb :index
    end

    get '/chats' do
      erb :chats
    end

    get '/chats/2' do
      erb :chat_two
    end

    # Helpers
    # => define helper methods.

030e369c5662e7d22f30c7f99b188be02fd36155
    helpers do
      include Rack::Utils
      
      alias_method :h, :escape_html
      
      def partial(file_name)
        erb file_name, :layout => false
      end
    end
  end
end
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

    # Route Definitions
    get '/' do
      erb :index
    end

    get '/chats' do
      erb 'chats/index'.to_sym
    end

    get '/chats/:id' do
      begin
        erb "chats/chat_#{params[:id]}".to_sym
      rescue Errno::ENOENT
        redirect '/'
      end
    end

    error do
      redirect '/'
    end

    not_found do
      redirect '/'
    end

    # Helper Methods
    helpers do
      include Rack::Utils
      
      alias_method :h, :escape_html
      
      def partial(file_name)
        erb file_name, :layout => false
      end
    end
  end
end
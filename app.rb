# Include:
# => Authentication File
# => Concerns | Helpers | Models
# => Database Configuration
# => Debug Tools
# => Sinatra Libraries
require_relative 'environment'

# Rename 'AppName' to name of choice.
# => Update 'AppName' : config.ru // spec_helper.rb
module AppName
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    # Configure Options
    # => set configuration options.

    # ==> Set default paths for static content.
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    # ==> Set global JavaScript files for project.
    set :javascripts, [:jquery]

    # Filters
    # => add route filters.

    # Routes
    # => define controller actions.

    # ==> Render index page.
    get '/' do
      erb :index
    end

    # Helpers
    # => define helper methods.

    helpers do
      # ==> Enable partials in all templates.
      def partial(file_name)
        erb file_name, :layout => false
      end

      def h(text)
        # ==> Capability to escape HTML.
        Rack::Utils.escape_html(text)
      end
    end
  end
end
require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])

CodeNewbie::Application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.codenewbie.com' }
end

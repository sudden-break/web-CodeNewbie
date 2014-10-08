require 'mandrill'

class UserMailer < ActionMailer::Base
  default from: "hello@codenewbie.org"

  # ActionMailer::Base.default_url_options = { :host => "192.168.1.1", port: 3000 }
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.perform_deliveries = true
  # ActionMailer::Base.raise_delivery_errors = true
  # ActionMailer::Base.default :charset => "utf-8"

  def test_email
    # mandrill = Mandrill::API.new MANDRILL_PASSWORD

    mail(to: "saron.yitbarek@gmail.com", subject: "It's not me!")do |format|
      format.text { render text: "hi"}
    end

    # mail = {
    #   :subject => "hi",
    #   :to => [{"email"=>"saron.yitbarek@gmail.com",
    #         "name"=>"Saron",
    #         "type"=>"to"}],
    #   :from_email => "hello@codenewbie.org",
    #    :text => "howdy"
    #  }

    # mandrill.messages.send mail

  end

end
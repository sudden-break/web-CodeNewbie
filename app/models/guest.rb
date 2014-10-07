class Guest < ActiveRecord::Base
  has_many :picks
  has_many :show_guests
  has_many :chats
  has_many :podcasts, through: :show_guests

  def self.sanitize_and_create(guest_params)
    Guest.new(sanitize_params(guest_params))
  end

  def self.sanitize_params(params)
   params.each do |k, v|
     params[k] = v.reject(&:blank?) if params[k].class == Array
    end
  end

end

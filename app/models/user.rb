class User < ActiveRecord::Base
  has_one :twitter_account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      user.update(photo: auth.extra.raw_info.profile_image_url.gsub("_normal", ""))
      user.twitter_account.update(followers_count: auth.extra.raw_info.followers_count)
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.uid+"@twitter.com",
                            password: Devise.friendly_token[0,20],
                            photo: auth.extra.raw_info.profile_image_url.gsub("_normal", ""),
                            twitter_account: TwitterAccount.create(followers_count: auth.extra.raw_info.followers_count, handle: auth.extra.raw_info.screen_name )
                          )
      end

    end
  end

end

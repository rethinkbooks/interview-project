# Model for storing authenticated users. The first time a user logs in via
# GitHub OAuth some of their account information will be stored for later use.
class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:github]

  # Find or create a user by OAuth provider and OAuth UID. If the user does not
  # already exist then their basic account information is set by the info
  # returned by the OAuth response.
  #
  # ==== Parameters
  # * <tt>auth</tt> - GitHub OAuth response. The OAuth response should have an
  #   info attribute with the following attributes of it's own:
  #   * email
  #   * name
  #   * nickname
  #   * image
  #   * urls (which should be a Hash)
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email

      user.password = Devise.friendly_token[0, 20]

      user.name = auth.info.name

      user.nickname = auth.info.nickname

      user.image_url = auth.info.image

      user.github_url = auth.info.urls['GitHub']
    end
  end
end

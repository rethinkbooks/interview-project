class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:github]

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

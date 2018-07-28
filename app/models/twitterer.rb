class Twitterer < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth[:info][:user_name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |twitterer|
      twitterer.user_name = user_name
      twitterer.image_url = image_url
    end
  end
end

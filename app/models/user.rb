class User < ApplicationRecord
  has_many :trees, dependent: :destroy

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.name = name
      user.image_url = image_url
    end
  end

  def to_param
    nickname
  end
end

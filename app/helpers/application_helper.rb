module ApplicationHelper
  def get_twitter_card_info(user)
    twitter_card = {}
    if user
      twitter_card[:url] = 'http://lifetree.work/#{user.nickname}'
      twitter_card[:title] = 'LifeTree'
      twitter_card[:description] = "@#{user.name}さんのTree"
      twitter_card[:image] = 'https://bitbucket.org/skmt1111/ubuntu_0316_lifetree/src/master/app/assets/images/logo.png'
    else
      twitter_card[:url] = 'http://lifetree.work/'
      twitter_card[:title] = 'あなたの人生や目標を一本の木で表現しよう「LifeTree」'
      twitter_card[:description] = 'これまでの人生やこれからの目標などを管理できるサービスです。'
      twitter_card[:image] = 'https://bitbucket.org/skmt1111/ubuntu_0316_lifetree/src/master/app/assets/images/logo.png'
    end
    twitter_card[:card] = 'summary'
    twitter_card[:site] = '@LifeTree'
    twitter_card
  end
end

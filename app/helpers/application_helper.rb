module ApplicationHelper
  def get_twitter_card_info(user)
    twitter_card = {}
    if user
      twitter_card[:url] = 'http://lifetree.work/#{user.nickname}'
      twitter_card[:title] = 'LifeTree'
      twitter_card[:description] = "@#{user.name}さんのTree"
    else
      twitter_card[:url] = 'http://lifetree.work/'
      twitter_card[:title] = 'あなたの人生や目標を一本の木で表現しよう「LifeTree」'
      twitter_card[:description] = 'これまでの人生やこれからの目標などを管理できるサービスです。'
    end
    twitter_card[:image] = 'assets/logo.png'
    twitter_card[:card] = 'summary'
    twitter_card[:creator] = '@slopebook___'
    twitter_card
  end
end

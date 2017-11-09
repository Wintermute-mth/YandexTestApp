class YandexNewsItem
  attr_accessor :title, :description, :created_at

  def self.current
    yandex_news = YandexNewsService.new.perform
    item = self.new
    item.title = yandex_news[:title]
    item.description = yandex_news[:description]
    item.created_at = yandex_news[:created_at]

    item
  end
end
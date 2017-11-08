class YandexNewsItem
  attr_accessor :title, :description, :created_at

  def initialize
    yandex_news = YandexNewsService.new.perform
    self.title = yandex_news[:title]
    self.description = yandex_news[:description]
    self.created_at = yandex_news[:created_at]
  end
end
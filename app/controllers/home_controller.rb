class HomeController < ApplicationController
  def index
    @item = NewsItem.current || YandexNewsItem.current
  end
end

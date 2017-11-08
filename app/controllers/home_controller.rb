class HomeController < ApplicationController
  def index
    @item = NewsItem.current_item || YandexNewsItem.new
  end
end

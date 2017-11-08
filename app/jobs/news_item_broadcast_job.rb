class NewsItemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(item=nil)
    news_item = item || YandexNewsItem.new
    ActionCable.server.broadcast 'news_item_channel', message: render_news_item(news_item)
  end

  private

  def render_news_item(item)
    ApplicationController.renderer.render(partial: 'news_items/item', locals: { item: item })
  end
end

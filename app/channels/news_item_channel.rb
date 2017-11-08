class NewsItemChannel < ApplicationCable::Channel
  def subscribed
    stream_from "news_item_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def change_item(data)
    ActionCable.server.broadcast 'news_item_channel', message: data['message']
  end
end

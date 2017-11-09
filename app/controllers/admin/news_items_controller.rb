class Admin::NewsItemsController < ApplicationController
  def new
    @item = current_item || NewsItem.new(expire_at: Time.now)
  end

  def create
    @item = NewsItem.new(permit_params)

    if @item.save
      item_news_job(@item)
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @item = current_item
    if @item && @item.update(permit_params)
      item_news_job(@item)
      redirect_to admin_path
    elsif !@item
      redirect_to admin_path
    else
      render 'new'
    end
  end

  private

  def current_item
    NewsItem.current
  end

  def item_news_job(item)
    ::NewsItemBroadcastJob.perform_later(item)
    ::NewsItemBroadcastJob.set(wait: item.expire_at - Time.now).perform_later
  end

  def permit_params
    params.require(:news_item).permit(:title, :description, :expire_at)
  end
end
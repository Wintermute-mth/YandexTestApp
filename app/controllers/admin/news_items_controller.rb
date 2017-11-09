class Admin::NewsItemsController < ApplicationController
  def new
    @item = current_item || NewsItem.new(expire_at: Time.now)
  end

  def create
    @item = NewsItem.new(permit_params)

    if @item.save
      ::NewsItemBroadcastJob.perform_later(@item)
      ::NewsItemBroadcastJob.set(wait: @item.expire_at - Time.now).perform_later
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @item = current_item
    if @item && @item.update(permit_params)
      ::NewsItemBroadcastJob.perform_later(current_item)
      ::NewsItemBroadcastJob.set(wait: @item.expire_at - Time.now).perform_later
      redirect_to admin_path
    elsif !@item
      redirect_to admin_path
    else
      render 'new'
    end
  end

  private

  def current_item
    NewsItem.current_item
  end

  def permit_params
    params.require(:news_item).permit(:title, :description, :expire_at)
  end
end
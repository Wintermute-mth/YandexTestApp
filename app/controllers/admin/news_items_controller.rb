class Admin::NewsItemsController < ApplicationController
  def new
    @item = current_item || NewsItem.new
  end

  def create
    @item = NewsItem.new(permit_params)

    if @item.save
      current_item.try(:destory)
      ::NewsItemBroadcastJob.perform_later(@item)
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    if current_item.update(permit_params)
      ::NewsItemBroadcastJob.perform_later(current_item)
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
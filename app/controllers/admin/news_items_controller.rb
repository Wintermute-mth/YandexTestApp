class Admin::NewsItemsController < ApplicationController
  def new
    @item = current_item || NewsItem.new
  end

  def create
    @item = NewsItem.new(permit_params)

    if @item.save
      current_item.try(:destory)
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
class HomeController < ApplicationController
  def index
    @item = NewsItem.current_item    
  end
end

Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :news_items, only: [:create]
    get '/', to: 'news_items#new'
  end
end

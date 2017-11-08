Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :news_items, only: [:create, :update]
    get '/', to: 'news_items#new'
  end

  mount ActionCable.server => '/cable'
end

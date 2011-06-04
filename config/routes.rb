Rails.application.routes.draw do

  namespace :admin do
    resources :products do
      resources :store_prices
    end
  end

end

Rails.application.routes.draw do


  get 'static_pages/apropos'
  get 'static_pages/home'
  resources :dons
  resources :charges
  root "dons#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root to: 'comprovantes#index'

  resources :imagens
  resources :comprovantes
end

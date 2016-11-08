Rails.application.routes.draw do

  root to: 'comrpovantes#index'

  resources :imagens
  resources :comprovantes
end

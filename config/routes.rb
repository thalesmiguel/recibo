Rails.application.routes.draw do

  root to: 'comprovantes#index'

  resources :imagens
  resources :comprovantes, only:[:index, :new, :create, :update, :destroy]
  get 'comprovantes/imprimir', to: 'comprovantes#imprimir', as: 'imprimir_comprovantes', defaults: {format: :pdf}

end

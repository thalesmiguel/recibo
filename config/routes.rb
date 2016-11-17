Rails.application.routes.draw do

  root to: 'comprovantes#index'

  resources :imagens

  resources :comprovantes, only: [:index, :new, :create, :update, :destroy] do
    post 'imprimir', to: 'comprovantes#imprimir', defaults: {format: :pdf}, on: :collection
  end

end

Rails.application.routes.draw do

  devise_for :usuarios, controllers: { registrations: "registrations" }
  resources :usuarios, only: [:index, :destroy]
  devise_scope :usuario do
    get "usuarios/:id/edit" => "registrations#edit", as: 'edit_usuario'
  end

  root to: 'comprovantes#index'

  resources :imagens

  resources :comprovantes, only: [:index, :new, :create, :update, :destroy] do
    post 'imprimir', to: 'comprovantes#imprimir', defaults: {format: :pdf}, on: :collection
  end

end

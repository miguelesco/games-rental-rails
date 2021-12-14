Rails.application.routes.draw do
  root 'users#create'
  namespace :api, defaults: { format: 'json' } do
    post 'sign_up', to: 'users#create'
    post 'sign_in', to: 'users#login'

    post 'games/new', to: 'games#create'
    get 'games', to: 'games#retrieve'
    delete 'games/:id/delete', to: 'games#delete'

    post 'reservation/new', to: 'reservations#create'
    put 'reservation/:id/update', to: 'reservations#update'
    delete 'reservation/:id/delete', to: 'reservations#delete'
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

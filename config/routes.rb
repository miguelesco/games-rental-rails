<<<<<<< HEAD
Rails.application.routes.draw do
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
=======
Rails.application.routes.draw do
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
  root 'users#api_docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
>>>>>>> 9e34008bca8b602d22488f74920724ecae46d240

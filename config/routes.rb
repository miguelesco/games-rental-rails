Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    post 'sign_up', to: 'users#create'
    get 'sign_in', to: 'users#login'
    post 'add_game', to: 'games#create'
    get 'games', to: 'games#retrieve'
    delete 'game_delete', to: 'games#delete'
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

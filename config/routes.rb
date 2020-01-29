Rails.application.routes.draw do
  devise_for :users,  controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    root to: 'users/sessions#new'
  end

  get '/user', to: 'users#show'
  get '/users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

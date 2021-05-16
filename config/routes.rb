Rails.application.routes.draw do
  devise_for :users

  get '/transactions', to: 'transactions#index'
  post '/transfer', to: 'transactions#transfer'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end

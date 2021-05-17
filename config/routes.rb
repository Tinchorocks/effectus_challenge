Rails.application.routes.draw do
  namespace :v1 do 
    mount_devise_token_auth_for 'User', at: 'auth'
    get '/transactions', to: 'transactions#index'
    post '/transfer', to: 'transactions#transfer'
    
    resources :sessions, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end

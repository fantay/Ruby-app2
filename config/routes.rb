Rails.application.routes.draw do

    get '/signup' => 'users#new'

    get '/home', to: 'static_pages#home'

    get '/help', to: 'static_pages#help'

    get '/about', to: 'static_pages#about'

    get '/contact', to: 'static_pages#contact'

    root "static_pages#home"

    resources :users

    get '/login', to: 'sessions#new'

    post '/login', to: 'sessions#create'

    delete '/logout', to: 'sessions#destroy'

    get 'sessions/new'

    resources :account_activations, only: [:edit]

end

Rails.application.routes.draw do
  #get 'home/index'
  #get '/new', to: 'pokemons#new', as: 'new'
  #get '/create', to: 'pokemons#create', as: 'create'
  #post '/pokemons', to: 'pokemons#create'

  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  patch '/capture', to: 'pokemons#capture', as: 'capture'
  patch '/damage', to: 'trainers#damage', as: 'damage'
  get '/pokemons/new', to: 'pokemons#new', as: 'new_pokemon'
  post '/pokemons', to: 'pokemons#create', as: 'create'
  
end

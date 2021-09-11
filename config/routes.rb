Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  # passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  # passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}


  resources :comments, only: [:create, :destroy]
  resources :posts
  resources :rankings, only: [:index]
  resources :users, only: [:index, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  get '/search' => 'searches#search'
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

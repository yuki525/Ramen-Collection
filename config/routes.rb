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



  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :ranks, only: [:index]
  resources :users, only: [:index, :edit, :update]

  root 'homes#top'
  get '/search' => 'posts#search'
  get '/about' => 'homes#about'
  get '/rank/evaluation' => 'ranks#show'
  get '/searchtaste' => 'searches#search'


  get   'inquiry'         => 'inquiry#index'     # 入力画面
  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

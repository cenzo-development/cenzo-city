Rails.application.routes.draw do

  delete 'sessions/logout' => 'sessions#destroy', as: 'logout'
  post 'sessions/new' => 'sessions#create', as: 'create_session'

  get 'passcode/confirm' => 'passcode#confirm', as: 'confirm_mobile'
  get 'passcode/enter' => 'passcode#enter', as:  'enter_code'
  post 'passcode/enter' => 'passcode#submit', as:  'submit_code'

  get '/support' => 'information#support_info', as: 'support'
  get '/register' => 'information#register_info', as: 'register'

  get '/psych_client/new' => 'psych_client#new', as: 'new_psych_client'
  post '/psych_client/new' => 'psych_client#create', as: 'create_psych_client'

  #get 'clients/search' => 'clients#search', as: 'search_clients'
  get 'clients/not_found' => 'clients#not_found', as: 'client_not_found'

  get 'misc/address' => 'misc#check_address'

  get 'organisations/new' => 'organisations#new', as: 'new_organisation'
  post 'organisations/new' => 'organisations#create', as: 'create_organisation'


  root to: 'dashboard#index'

  resources :sessions, only: [:new]
  resources :dashboard, only: [:index]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :clients, only: [:index, :show, :edit] do
    member do
      patch :edit, action: :update, as: 'update_edit'
    end
    collection do
      post :index, action: :search, as: 'search_index'
    end
  end

  resources :organisations, only: [:index, :show, :edit] do
    member do
      patch :edit, action: :update, as: 'update_edit'
    end
    collection do
      post :index, action: :search, as: 'search_index'
    end
  end


end

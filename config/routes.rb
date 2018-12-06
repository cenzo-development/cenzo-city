Rails.application.routes.draw do

  delete 'sessions/logout' => 'sessions#destroy', as: 'logout'
  post 'sessions/new' => 'sessions#create', as: 'create_session'

  get 'passcode/confirm' => 'passcode#confirm', as: 'confirm_mobile'
  get 'passcode/enter' => 'passcode#enter', as:  'enter_code'
  post 'passcode/enter' => 'passcode#submit', as:  'submit_code'

  get '/support' => 'information#support_info', as: 'support'
  get '/register' => 'information#register_info', as: 'register'


  resources :sessions, only: [:new]
  resources :dashboard, only: [:index]
  resources :password_resets, only: [:new, :create, :edit, :update]

  root to: 'dashboard#index'
end

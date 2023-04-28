Rails.application.routes.draw do
  post :login, to: "sessions#create"
  post :register, to: "registrations#create"
  delete :logout, to: "sessions#destroy"
  get :logged_in, to: "sessions#logged_in"
  get :users_online, to: "application#users_online"
  # post :create_message, to: "messages#create"
  # delete :destroy_message, to: "messages#destroy"
  # patch :update_message, to: "messages#update"
  resources :messages
  mount ActionCable.server => "/cable"
end

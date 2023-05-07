Rails.application.routes.draw do
  post :login, to: "sessions#create"
  post :register, to: "registrations#create"
  delete :logout, to: "sessions#destroy"
  get :users_online, to: "application#connected_users"
  resources :messages
  mount ActionCable.server => "/cable"
end

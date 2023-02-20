Rails.application.routes.draw do
  post :login, to: "sessions#create"
  post :register, to: "registrations#create"
  delete :logout, to: "sessions#destroy"
  get :logged_in, to: "sessions#logged_in"
end

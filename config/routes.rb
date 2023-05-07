Rails.application.routes.draw do
  post :login, to: "sessions#create" # Создаем маршрут POST запроса на /login, который будет обрабатываться в контроллере SessionsController методом create.
  post :register, to: "registrations#create" # Создаем маршрут POST запроса на /register, который будет обрабатываться в контроллере RegistrationsController методом create.
  delete :logout, to: "sessions#destroy" # Создаем маршрут DELETE запроса на /logout, который будет обрабатываться в контроллере SessionsController методом destroy.
  get :users_online, to: "application#connected_users" # Создаем маршрут GET запроса на /users_online, который будет обрабатываться в контроллере ApplicationController методом connected_users.
  resources :messages # Создаем RESTful ресурс для работы с сообщениями, который будет обрабатываться в контроллере MessagesController.
  mount ActionCable.server => "/cable" # Монтируем Action Cable сервер на путь /cable.
end

class RegistrationsController < ApplicationController
  # Определяем контроллер для обработки запросов на регистрацию новых пользователей

  def create
    # Обработчик POST-запросов на создание новых пользователей. Извлекаем данные из параметров запроса
    user = User.create!(username: params[:user][:username],
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation])

    # Создаем нового пользователя с использованием данных из параметров. В случае успеха отправляем ответ с HTTP-статусом 201 и данными пользователя в формате JSON
    if user
      render json: {
        status: :created,
        user: {
          id: user.id,
          username: user.username,
        }
      }
    else
      # В случае ошибки возвращаем HTTP-статус 500
      head(500)
    end
  end
end

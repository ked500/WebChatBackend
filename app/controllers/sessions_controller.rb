class SessionsController < ApplicationController
  # Включаем concern, который помогает получить текущего пользователя
  include CurrentUserConcern

  # Пропускаем before_action для метода create, чтобы сначала проверить аутентификацию пользователя
  skip_before_action :set_current_user, only: [:create]

  # Создаем сессию для пользователя
  def create
    # Ищем пользователя по имени пользователя и проверяем его пароль
    user = User.find_by(username: params[:user][:username])
               .try(:authenticate, params[:user][:password])

    if user
      # Если пользователь найден и аутентифицирован, сохраняем его ID в сессию
      user_id = user.id
      session[user_id] = user.id

      # Возвращаем JSON с данными пользователя и статусом создания
      render json: {
        status: :created,
        user: { id: user.id, username: user.username, }
      }
    else
      # Если пользователь не найден или неправильный пароль, возвращаем статус 401 Unauthorized
      head(:unauthorized)
    end
  end

  # Удаляем сессию для пользователя
  def destroy
    # Удаляем из сессии ID пользователя, переданного в параметре
    session.delete(params[:user_id])
    head(:ok)
  end
end
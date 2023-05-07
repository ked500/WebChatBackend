class ApplicationController < ActionController::API
  include ::ActionController::Cookies # Включаем модуль ActionController::Cookies, чтобы получать доступ к методам работы с куки.

  def connected_users
    render json: ActionCable.server.connections.length # Возвращает количество подключенных пользователей через ActionCable.
  end
end

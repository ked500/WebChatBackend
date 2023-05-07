# frozen_string_literal: true

module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user # Вызываем метод set_current_user перед выполнением любых действий в контроллере, подключающем этот модуль.
  end

  def set_current_user
    if params[:user_id] && User.find(params[:user_id])
      @current_user = User.find(params[:user_id]) # Устанавливаем переменную @current_user, если параметр user_id задан и соответствующий пользователь найден в базе данных.
    else
      head :unauthorized # Если параметр user_id не задан или не найден соответствующий пользователь, возвращаем ошибку 401 Unauthorized.
    end
  end
end

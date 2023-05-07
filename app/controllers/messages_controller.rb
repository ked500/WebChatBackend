class MessagesController < ApplicationController
  include CurrentUserConcern # Подключаем модуль CurrentUserConcern, который определяет метод set_current_user для установки текущего пользователя.
  before_action :set_message, only: [:update,:destroy] # Вызываем метод set_message перед методами update и destroy.
  skip_before_action :set_current_user, only: [:index] # Пропускаем вызов метода set_current_user перед методом index.

  def create
    @message = @current_user.messages.build(message_params) # Создаем новое сообщение, связанное с текущим пользователем.
    if @message.save # Если сообщение сохранено успешно, возвращаем JSON с данными сообщения.
      render json: {
        status: :created,
        message: @message
      }
    else # Иначе возвращаем статус ошибки.
      render json: { status: :unprocessable_entity }
    end
  end

  def destroy
    @message.destroy # Удаляем сообщение.
    head :ok # Возвращаем успешный статус без тела ответа.
  end

  def update
    if @message.update(message_params) # Если сообщение успешно обновлено, возвращаем JSON с обновленными данными.
      render json: {message: { content: @message.content } }
    else # Иначе возвращаем статус ошибки.
      head :unprocessable_entity
    end
  end

  def index
    @messages = Message.all.order(:created_at => :asc) # Получаем все сообщения из базы данных, упорядоченные по дате создания.
    render json: @messages # Возвращаем JSON со списком сообщений.
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_name) # Определяем допустимые параметры сообщения для методов create и update.
  end

  def set_message
    @message = @current_user.messages.find_by(id: params[:id]) # Находим сообщение, связанное с текущим пользователем, по его идентификатору.
    head(:unprocessable_entity) if @message.nil? # Если сообщение не найдено, возвращаем статус ошибки без тела ответа.
  end
end

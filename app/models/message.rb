class Message < ApplicationRecord
  # устанавливает связь "принадлежность к пользователю" для модели Message
  belongs_to :user
  # устанавливает валидацию на наличие контента
  validates_presence_of :content
  # вызывает метод broadcast_message после создания нового сообщения
  after_create_commit {broadcast_message}

  private
  # определяет метод для отправки сообщения всем подключенным клиентам через WebSocket
  def broadcast_message
    ActionCable.server.broadcast("MessagesChannel",{
      # передает id сообщения
      id:,
      # передает id пользователя, создавшего сообщение
      user_id:,
      # передает имя пользователя, создавшего сообщение
      user_name:,
      # передает контент сообщения
      content:,
      # передает дату создания сообщения
      created_at:
    })
  end
end

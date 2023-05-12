class Message < ApplicationRecord
  # Подключаем модуль   include MessageBroadcastConcern, который определяет метод broadcast_messages для отправки списка сообщений через сокет.
  include MessageBroadcastConcern
  # устанавливает связь "принадлежность к пользователю" для модели Message
  belongs_to :user
  # устанавливает валидацию на наличие контента
  validates_presence_of :content
  # вызывает метод broadcast_message после создания нового сообщения
  after_create_commit {broadcast_message}
  # вызывает метод broadcast_messages после удаления сообщения
  after_destroy_commit {broadcast_messages(:destroy)}
  # вызывает метод broadcast_messages после обновления сообщения
  after_update_commit { broadcast_messages(:update)}

  private
  # определяет метод для отправки сообщения всем подключенным клиентам через WebSocket
  def broadcast_message
    ActionCable.server.broadcast("MessagesChannel",{type: :create,
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

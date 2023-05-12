# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  include MessageBroadcastConcern
  def subscribed
    stream_from "MessagesChannel" # Подключаемся к каналу MessagesChannel и начинаем прослушивать сообщения.
    broadcast_messages(:connection)
  end

  def unsubscribed
    # Этот метод вызывается при отключении пользователя от канала. Здесь может быть код, выполняющий действия при отключении.
  end
end

# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "MessagesChannel" # Подключаемся к каналу MessagesChannel и начинаем прослушивать сообщения.
  end

  def unsubscribed
    # Этот метод вызывается при отключении пользователя от канала. Здесь может быть код, выполняющий действия при отключении.
  end
end

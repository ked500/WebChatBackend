# frozen_string_literal: true

module MessageBroadcastConcern
  def broadcast_messages(type)
    #отправляем через сокет по каналу MessagesChannel тип и список сообщений отсортированный по дате создания
    ActionCable.server.broadcast("MessagesChannel", {type: type, data: Message.all.order(:created_at => :asc)})
  end
end

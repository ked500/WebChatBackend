# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
 def subscribed
   stream_from "MessagesChannel"
 end

 def unsubscribed

 end
end
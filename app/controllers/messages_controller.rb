class MessagesController < ApplicationController
  include CurrentUserConcern
  before_action :correct_user, only: [:destroy, :update]
  before_action :set_message, only: [:update]
  before_action :set_websocket, only: [:create, :update, :destroy]

  def create
    @message = @current_user.messages.build(message_params)
    if @message.save
      @websocket.broadcast_to('chat_channel',{message: @message, action: 'create'})
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    @websocket.broadcast_to('chat_channel',{message_id: params[:message_id], action: 'destroy'})
    head :ok
  end

  def update
    if @message.update(message_params)
      @websocket.broadcast_to('chat_channel',{message: @message, action: 'update'})
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def correct_user
    @message = @current_user.messages.find_by(id: params[:message_id])
    head(:unprocessable_entity) if @message.nil?
  end

  def set_message
    @message = Message.find(params[:message_id])
  end

  def set_websocket
    @websocket = ActionCable.server
  end
end

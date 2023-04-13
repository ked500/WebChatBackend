class MessagesController < ApplicationController
  include CurrentUserConcern
  before_action :correct_user, only: [:destroy, :update]
  before_action :set_message, only: [:update]
  skip_before_action :set_current_user, only: [:index]

  def create
    @message = @current_user.messages.build(message_params)
    if @message.save
      render json: {
        status: :created,
        message: { content: @message.content, }
      }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  def destroy
    @message.destroy
    head :ok
  end

  def update
    if @message.update(message_params)
      render json: {message: { content: @message.content } }
    else
      head :unprocessable_entity
    end
  end

  def index
    @messages = Message.all
    render json: @messages
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
end

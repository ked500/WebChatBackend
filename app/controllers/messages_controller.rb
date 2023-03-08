class MessagesController < ApplicationController
  include CurrentUserConcern

  def create
    @message = @current_user.messages.build(message_params)
    if @message.save
      render json: {
        status: :created,
        message: {
          content: @message.content,
        }
      }
    else
      render json: {
        status: :unprocessable_entity
      }
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end

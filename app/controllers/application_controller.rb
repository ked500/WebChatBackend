class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def users_online
    render json: ActionCable.server.connections.length
  end
end

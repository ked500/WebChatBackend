class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def connected_users
    render json: ActionCable.server.connections.length
  end
end

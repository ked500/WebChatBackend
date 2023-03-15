class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(username: params[:user][:username])
               .try(:authenticate, params[:user][:password])

    if user
    user_id = user.id
    session[user_id] = user.id
      render json: {
        status: :created,
        user: {
          id: user.id,
          username: user.username,
        }
      }
    else
      head(:unauthorized)
    end
  end

  def destroy
    session.delete(params[:user_id])
    head(:ok)
  end

  def logged_in
    if @current_user
      render json: {
        user: {
          id: @current_user.id,
          username: @current_user.username,
        }
      }
    else
      render json: {
        logged_in: false
      }
    end
  end
end
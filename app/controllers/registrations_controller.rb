class RegistrationsController < ApplicationController

  def create
    user = User.create!(username: params[:user][:username],
    password: params[:user][:password],
    password_confirmation: params[:user][:password_confirmation]
    )

    if user
      render json: {
        status: :created,
        user: {
          id: user.id,
          username: user.username,
        }
      }
    else
      head(500)
    end
  end
end
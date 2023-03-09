# frozen_string_literal: true

module CurrentUserConcern
  extend ActiveSupport::Concern


  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[params[:user_id]]
      @current_user = User.find(session[params[:user_id]])
    else
      head :unauthorized
    end
  end
end
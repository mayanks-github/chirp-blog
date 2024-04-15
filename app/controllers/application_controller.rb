class ApplicationController < ActionController::API
  def authenticate_user!
    unless logged_in?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_token_present?
      auth_token = AuthToken.find_by(token: auth_token)
      if auth_token
        @current_user ||= auth_token.user
      else
        nil
      end
    end
  end
  
  private

  def auth_token_present?
    !!request.headers['HTTP_ACCESSTOKEN']&.split(' ')&.last
  end

  def auth_token
    request.headers['HTTP_ACCESSTOKEN']&.split(' ')&.last
  end
end

class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      token = AuthTokenService.generate_token(user.id)
      AuthToken.create(token: token, user: user)
      render json: { status: :created, logged_in: true, user: user, token: token }
    else
      render json: { status: 401, errors: ['Authentication failed. Invalid email/password.'] }
    end
  end

  def destroy
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      user.auth_tokens.destroy_all
      render json: { status: 200, logged_out: true }
    else
      render json: { status: 401, errors: ['Invalid or expired token.'] }
    end
  end
end
class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      token = AuthTokenService.generate_token(user.id)
      render json: { status: :created, logged_in: true, user: user, token: token }
    else
      render json: { status: 401, errors: ['Authentication failed. Invalid email/password.'] }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { status: 200, logged_out: true }
  end
end

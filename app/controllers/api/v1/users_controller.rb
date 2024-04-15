class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:edit_email, :edit_number, :edit_password, :update]

  def register
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit_email
    if @user.update(email: params[:email])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit_number
    if @user.update(number: params[:number])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def edit_password
    if @user.update(password: params[:password])
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :number, :password)
  end
end

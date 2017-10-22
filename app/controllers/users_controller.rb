class UsersController < ApplicationController
  before_action :authorize
  before_action :set_user

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :password, :password_confirmation)
  end
end

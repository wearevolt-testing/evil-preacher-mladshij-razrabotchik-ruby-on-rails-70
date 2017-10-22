class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_user

   #can't explain, but without this don't see ':password'
  wrap_parameters :user, include: [:nickname, :email, :password, :password_confirmation]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end

class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path
    else
      redirect_to '/login', alert: 'Вы должны аутентифицироваться'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Logged in'
        redirect_to users_path
      else
        flash[:error] = 'Invalid password'
        render 'new'
      end
    else
      flash[:error] = 'User not found'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'Logged out'
    redirect_to root_path
  end
end

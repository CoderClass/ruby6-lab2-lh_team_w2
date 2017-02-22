class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
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
end

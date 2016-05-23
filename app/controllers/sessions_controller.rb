class SessionsController < ApplicationController
  def login

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to chores_path,
        notice: "Welcome back #{user.name.titleize}"
    else
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    if user = current_user
      session[:id] = nil
      redirect_to root_path,
        notice: "#{user.name} has been logged out."
    end
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new

  end
  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to dashboard_path,
        notice: "Thank you for signing up #{@user.name.capitalize}"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :cell_phone_number, :email,
      :password, :password_confirmation
    )
  end
end


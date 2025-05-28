class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path, notice: "Signed up!"
    else
      render :new
    end
  end

  def show
    @user = current_user
    @reading_records = @user.reading_records.includes(:book)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in to view your profile."
    end
  end
end


class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_parameters
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Successfully signed up"
    else
      render :new
    end
  end

  private
    def user_parameters
      params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
    end
end

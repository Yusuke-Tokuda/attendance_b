class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  
  
  def show
  end
  
  def index
    @users =User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "アカウントを作成しました。"
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

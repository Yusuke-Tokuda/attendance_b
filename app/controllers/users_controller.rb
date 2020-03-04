class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  before_action :logged_in_user, only: %i(index show edit update)
  before_action :correct_user, only: %i(edit update)
  
  def show
  end
  
  def index
    @users =User.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # sessions_helpser の log_in メソッドに、@userという引数を渡す。これにより、クリエイトと同時にログイン。
      flash[:success] = "アカウントを作成しました。"
      redirect_to user_url(@user)
    else
      redirect_back_or user
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to current_user
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end

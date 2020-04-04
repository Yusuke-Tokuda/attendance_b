class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info]
  before_action :admin_or_current_user, only: [:show, :edit, :update, :edit_basic_info, :update_basic_info]
  # before_action :correct_user, only: [:edit, :update]
  before_action :set_one_month, only: :show

  def index
     @users = User.paginate(page: params[:page], per_page: 10).order('id ASC')
  end

  def index_working_users
    @working_users = []
      User.all.each do |user|
        if user.attendances.any?{|a| (Date.today && !a.started_at.blank? && a.finished_at.blank?)}
          @working_users.push(user)
        end
      end
  end

  def import
    if params[:file].blank?
      flash[:warning] = "CSVファイルが選択されていません。"
      redirect_to users_url
    else
      User.import(params[:file])
      flash[:success] = "ユーザー情報をインポートしました。"
      redirect_to users_url
    end
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規ユーザーを作成しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :index    
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :password, :password_confirmation,
                                   :basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end

    def basic_info_params
      params.require(:user).permit(:basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end
    
end
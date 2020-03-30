class BasesController < ApplicationController
  before_action :set_base, only: [:edit, :update, :destroy]
  before_action :admin_user
  
  def new
    @base = Base.new
  end

  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "新規拠点を作成しました。"
      redirect_to bases_url
    else
      render :new
    end
  end
  
  def index
    @bases = Base.all
  end
  
  def edit
  end
  
  def update
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to bases_url
    else
      render :edit
    end
  end
  
  def destroy
    @base.destroy
    flash[:success] = "#{@base.name}のデータを削除しました。"
    redirect_to bases_url
  end
  
  private

    def base_params
      params.require(:base).permit(:name, :base_number, :base_type)
    end
  
  
end

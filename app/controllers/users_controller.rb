class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def index
    @users =User.all
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end

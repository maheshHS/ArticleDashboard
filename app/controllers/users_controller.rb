class UsersController < ApplicationController

  def index
    @user_list = User.all.reverse()
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome To Article Dashboard #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account Was Updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Your account was created."
      redirect_to user_path @user
    else
      flash[:alert] = "Error creating user."
      redirect_to show_user_path
    end

  end

  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)  
      flash[:notice] = "You edited your account successfully."
      redirect_to user_path @user
    else
      flash[:alert] = "Error editing your account."
      redirect_to show_user_path
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User account has been destroyed!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem DESTROYING your account."
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end
end

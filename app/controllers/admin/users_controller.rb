class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:destroy,:assign_role]
  load_and_authorize_resource
  def index
    @users = User.includes(:roles)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "User created successfully"
    else
      flash[:alert] = "Something went wrong"
      redirect_back(fallback_location: root_path)
    end    
  end

  def new
    @user = User.new
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      # flash[:notice] = "User updated successfully"
      # redirect_back(fallback_location: root_path)
      redirect_to admin_users_path, notice: "User updated successfully"
    else
      flash[:alert] = "Something went wrong"
      redirect_back(fallback_location: root_path)
    end    
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "User destroyed successfully"
    redirect_back(fallback_location: root_path)
  end

  
  
  def assign_role
    
  end
  

  private 

    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:email,:password,:role_ids)
    end
    
end

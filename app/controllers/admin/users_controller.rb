class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:destroy,:permissions]
  
  def index
    @users = User.includes(:roles).select{|user| user.email != current_user.email}
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_back(fallback_location: root_path)
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
      flash[:notice] = "User updated successfully"
      redirect_back(fallback_location: root_path)
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

  def permissions
    
    binding.pry
    
  end
  
  

  private 

    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.permit(:email,:password)
    end
    
end

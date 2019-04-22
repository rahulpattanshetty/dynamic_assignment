class RolesController < ApplicationController
  
  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Role created successfully"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Something went wrong"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def role_params
      params.permit(:name)
    end
    
  
end
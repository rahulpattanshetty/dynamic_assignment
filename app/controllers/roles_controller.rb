class RolesController < ApplicationController
  load_and_authorize_resource
  def index
    @roles = Role.all
  end
  
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

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path, notice: "Deleted Successfully"
  end
  
  def permissions
    # if !@user.roles.present?
    #   flash[:alert] = "First you need to set role"
    #   return redirect_back(fallback_location: root_path)
    # end
    if params[:id]
      @role = Role.find(params[:id])
      @permissions  = @role.permissions.order(model_list_id: :asc)
    end
    
  end

  def update_permissions
    
    permission_params = params[:permission].permit(:is_read,:is_create,:is_destroy,:id)
    permission = Permission.find(permission_params[:id])
    permission.update(permission_params)
    flash[:notice] = "Permission updated successfully"
    redirect_back(fallback_location: root_path)
  end
  

  private

    def role_params
      params.require(:role).permit(:name)
    end
    
  
end
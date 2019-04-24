class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  rescue_from CanCan::AccessDenied do
  	redirect_to root_path, notice:"You are not authorized to access the page"
  end

  
  
end

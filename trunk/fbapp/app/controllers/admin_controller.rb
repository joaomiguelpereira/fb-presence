class AdminController < ApplicationController
  layout "admin"
  before_filter :require_admin_user
  def index
    
  end
  
  private
  def require_admin_user
    logger.debug "Checking is current user is Admin"
  end
  
end

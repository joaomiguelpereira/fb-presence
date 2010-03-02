# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  ensure_authenticated_to_facebook
  attr_accessor :current_user
  helper_attr :current_user
  before_filter :set_current_user
  layout "default"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private
  def set_current_user
    logger.debug "Setting current user"
    set_facebook_session
    logger.debug "facebook session is: #{facebook_session.inspect}"
    if facebook_session and facebook_session.secured?   
      self.current_user = User.for(facebook_session.user.to_s,facebook_session)
    end
    logger.debug "Current user is: #{self.current_user}"
  end
  
  
end

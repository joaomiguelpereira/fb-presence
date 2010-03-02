class User < ActiveRecord::Base
  
  def self.for(facebook_id, facebook_session=nil)
    logger.debug "Finding or creating by FB ID: #{facebook_id}"
    returning User.find_or_create_by_facebook_id(facebook_id) do |user|
      unless facebook_session.nil?
        user.store_session(facebook_session.session_key)
      end
    end
  end
  
  #Re-create a Facebooker::Session outside a request
  def facebook_session
    @facebook_session  ||= returning Facebooker::Session.create do |session|
      session.secure_with!(session_key,facebook_id, 1.hour.from_now)
    end
  end
   
  def store_session(session_key)
    logger.debug "Needs update for FB Session Key #{session_key}?"
    if self.session_key != session_key
      logger.debug "YES. Updating"
      update_attribute(:session_key, session_key)
    end
    
  end
  
end

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fb-presence-app_session',
  :secret      => '457d4664318af869445e4da491b26e04d94741db850474ab76d50dd194437d7dacc5c31219d743eaf9ce54c24602bece57e0b7eff1418c657176025ce65976c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

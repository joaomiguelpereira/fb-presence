#Load the WEB APP configuration for the current environment
WEBAPP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/webapp_config.yml")[Rails.env]


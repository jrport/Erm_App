# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

app_environment_variables = File.join(Rails.root, 'config', 'app_env_var.rb')
load(app_environment_variables) if File.exist?(app_environment_variables)

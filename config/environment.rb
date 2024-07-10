# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Load local env variables
app_environment_variables = File.join(Rails.root, 'config', 'env_variables.rb')
load(app_environment_variables) if File.exist?(app_environment_variables)

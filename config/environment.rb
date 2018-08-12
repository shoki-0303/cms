# Load the Rails application.
require_relative 'application'
ENV["REDIS"] = "http://localhost:6379"

# Initialize the Rails application.
Rails.application.initialize!

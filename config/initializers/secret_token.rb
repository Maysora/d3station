# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

if ENV['SECRET_TOKEN'].present?
  D3station::Application.config.secret_token = ENV['SECRET_TOKEN']

  # Do not raise an error if secret token is not available during assets precompilation
elsif ENV['RAILS_GROUPS'] != 'assets'
  raise <<-ERROR

  SECRET_TOKEN ENV not set, run:
  
    heroku config:add SECRET_TOKEN="$(bundle exec rake secret)"
  
  or

    echo "D3station::Application.config.secret_token = '$(bundle exec rake secret)'" > config/initializers/secret_token.rb

  ERROR
end
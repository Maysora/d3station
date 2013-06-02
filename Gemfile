source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'devise', '~> 2.2.4'
gem 'cancan', '~> 1.6.10'
gem 'acts-as-taggable-on', '~> 2.4.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails', '~> 1.0.3'
  gem 'compass_twitter_bootstrap', '~> 2.3.1'
end

group :production, :staging do
  gem 'newrelic_rpm'
  gem 'airbrake'
end

group :development do
  gem 'better_errors'
  gem 'pry-rails'
  gem 'thin'
  gem 'ctags_bundler_rails'
end

gem 'jquery-rails'
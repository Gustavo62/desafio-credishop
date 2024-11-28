source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "guard"
gem "guard-livereload", require: false
gem "bootstrap", "~> 4.3.1"
gem "sidekiq"
gem "redis"
gem "rubocop", require: false
gem "rubocop-rails", require: false
gem "mini_racer", platforms: :ruby

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false

  gem "faker"
end

group :development do
  gem "web-console"
  gem "pry-rails"
  gem "pry-byebug"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end


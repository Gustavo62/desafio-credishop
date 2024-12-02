source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "sprockets-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "redis"

gem "bootstrap", "~> 5.3.3"
gem "sassc-rails"
gem "webpacker"
gem "chart-js-rails"

gem "rubocop", require: false
gem "rubocop-rails", require: false
gem "rubocop-rails-omakase", require: false

gem "guard"
gem "guard-livereload", require: false
gem "mini_racer", platforms: :ruby
gem 'simple_form'

gem "sidekiq"

gem 'kaminari'
gem 'cocoon'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "faker"
  gem 'cpf_faker'

  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console"
  gem "pry-rails"
  gem "pry-byebug"
  gem "simplecov", require: false
end

group :test do
  gem "coverband"
  gem 'rack'
end

gem 'foreman', github: "ddollar/foreman"
gem 'jwt'
gem "devise"

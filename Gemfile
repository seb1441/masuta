source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", github: "rails/rails", branch: "master"

gem "bootsnap", "~> 1.5", ">= 1.5.1", require: false
gem "image_processing", "~> 1.12", ">= 1.12.1"
gem "jbuilder", "~> 2.10", ">= 2.10.1"
gem "pg", "~> 1.2", ">= 1.2.3"
gem "puma", "~> 5.1", ">= 5.1.1"
gem "sass-rails", ">= 6"
# gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "webpacker", github: "rails/webpacker"
# gem "webpacker", "~> 5.1"

gem "aws-sdk-s3", require: false
gem "devise", "~> 4.7"
gem "hiredis", "~> 0.6.3"
gem "honeybadger", "~> 4.7"
gem "pagy", "~> 3.8", ">= 3.8.2"
gem "redis", "~> 4.1", ">= 4.1.4"
gem "sendgrid-ruby", "~> 6.3"
gem "stimulus_reflex", "~> 3.2"
gem "view_component", "~> 2.7"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "standard", "~> 0.10.0"
end

group :development do
  gem "web-console", github: "rails/web-console"
  gem "annotate"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "stripe", "~> 5.23"

gem "turbo-rails", "~> 0.5.1"

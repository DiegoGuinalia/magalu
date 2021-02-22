source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'faker'
  gem 'shoulda-matchers'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'factory_bot_rails'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'listen', '~> 3.0.5'
gem 'will_paginate'
gem 'active_model_serializers'

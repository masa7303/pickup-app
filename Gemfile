source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'bullet'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '~> 3.0'
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem 'rails-controller-testing'
  gem 'spring-commands-rspec'
end

group :production, :staging do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ViewファイルでSlimを使えるようにする
gem 'slim-rails'
gem 'html2slim'
gem 'slim'

# 認証
gem 'sorcery'

# Bootstrapを導入
gem 'bootstrap'

# 日本語化
gem 'rails-i18n', '~> 5.1'

# 検索機能
gem 'ransack'

# タグ追加
gem 'acts-as-taggable-on', '~> 6.0'

# ページネーション
gem 'kaminari'
gem 'kaminari-bootstrap'

# jquery
gem 'jquery-rails'
gem 'jquery-turbolinks'

# 日本地図表示
gem 'jcanvas-rails', '~> 0.1.0'

# font-awesome
gem 'font-awesome-sass', '~> 5.12.0'

# decorateor
gem 'draper'

# simple_formを使用
gem 'simple_form'

# パンくずリスト
gem "gretel"

# 環境変数
gem 'dotenv-rails'

# 都道府県データ
gem 'jp_prefecture'

# ユーザー登録の際のデフォルト画像
gem 'carrierwave'

# AWSコンパイル用
gem 'mini_racer'

# JavaScriptとの連携
gem 'gon'

source 'https://rubygems.org'
gemspec

group :development do
  gem 'smart_proxy', :git => 'https://github.com/theforeman/smart-proxy.git', :branch => 'develop'
  gem 'rubocop', '0.38.0' if RUBY_VERSION > '1.8.7'
end

group :test do
  gem 'rack-test'
  gem 'single_test'
  gem 'test_xml'

  if RUBY_VERSION < '1.9.3'
    gem 'webmock', '< 2.0.0'
  else
    gem 'webmock'
  end
end

gem 'addressable', '< 2.2.0', :platforms => :ruby_18
gem 'json', '~> 1.0', :platforms => [:ruby_18, :ruby_19]

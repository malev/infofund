source :rubygems

# Project requirements
gem 'rake'
gem 'capistrano'
gem 'rvm-capistrano'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'haml'
gem 'mongoid', '2.4.12'
gem 'bson_ext', :require => "mongo"

# Test requirements
gem 'mocha', :group => "test"
gem 'rspec', :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# Padrino Stable Gem
gem 'padrino'
gem 'nokogiri'
gem 'padrino-warden'
gem 'capistrano', :group => :development, :require => false
gem 'whenever', :require => false

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(local_gemfile)
end

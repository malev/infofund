require 'bundler/capistrano'
require "whenever/capistrano"

set :application, "infofund"

set :user, "malev"
set :rvm_ruby_string, '1.9.2@infofund'
set :domain, "www.villabom.com.ar"
set :environment, "production"
set :deploy_to, "/home/malev/sites/#{application}"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :normalize_asset_timestamps, false

set :scm, :git
set :repository, "git://github.com/malev/infofund.git"
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :ssh_options, :forward_agent => true

set :keep_releases, 5

namespace :deploy do
  desc "symlink to mongoid.yml"
  task :create_symlink_shared do
    run "ln -nfs #{deploy_to}/shared/config/mongoid.yml #{release_path}/config/mongoid.yml"
  end

  task :migrate do
    puts "no mgirations"
  end

  desc "restarting"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after 'deploy:update_code', 'deploy:create_symlink_shared'
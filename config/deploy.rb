require 'bundler/capistrano'
set :application, "infofund"
set :rvm_ruby_string, '1.9.2@infofund'

set :domain, "www.villabom.com.ar"
set :environment, "production"
set :branch, "master"
set :deploy_to, "/home/malev/sites/infofund"

set :normalize_asset_timestamps, false

role :app, domain
role :web, domain
role :db, domain, :primary => true

default_run_options[:pty] = true

default_run_options[:shell] = 'bash'

default_environment["RAILS_ENV"] = 'production'

set :repository, "git://github.com/malev/infofund.git"
set :deploy_via, :remote_cache

set :scm, :git
set :scm_verbose, true
set :use_sudo, false
set :ssh_options, :forward_agent => true

set :user, "malev"
set :keep_releases, 5

namespace :deploy do
  desc "symlink to mongoid.yml"
  task :create_symlink do
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

after 'deploy:update_code', 'deploy:create_symlink', 'deploy:restart'
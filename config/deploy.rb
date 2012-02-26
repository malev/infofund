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
set :keep_releases, 7

namespace :deploy do
  desc "restarting"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "symlink vendor to shared vendor"
  task :symlink_vendor_to_shared_vendor do
    run "ln -s #{current_path}/../shared/vendor #{current_path}/vendor"
  end

  desc "trust rvmrc"
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end

  task :migrate do
    puts "no mgirations"
  end
end

after "deploy:restart"

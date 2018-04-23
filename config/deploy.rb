# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "rfid_prototype"
set :repo_url, "kenstclair@23.239.8.185:/home/git/nasa.juggl.me.git"

set :ssh_options, { :forward_agent => true }
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/kenstclair/public/nasa.juggl.me"
set :passenger_restart_with_touch, true


set :rvm_type, :user
set :rvm_ruby_string, '2.3.3'

# set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
# set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

# before 'deploy', 'rvm:install_rvm'  # install/update RVM
# before 'deploy', 'rvm:install_ruby' # install Ruby and create gemset, OR:

# require 'rvm/capistrano'
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :app do
  task :update_rvm_key do
  	on roles(:app) do 
      execute :gpg, "--keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3"
    end
  end
end


namespace :deploy do
#   desc "Make sure local git is in sync with remote."
#   task :check_revision do
#     on roles(:app) do
#       unless `git rev-parse HEAD` == `git rev-parse origin/master`
#         puts "WARNING: HEAD is not the same as origin/master"
#         puts "Run `git push` to sync changes."
#         exit
#       end
#     end
#   end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      # before 'deploy:restart', 'puma:start'
      before 'deploy', 'rvm1:install:rvm'  # install/update RVM
	  before 'deploy', 'rvm1:install:ruby'  # install/update Ruby
      invoke 'deploy'
    end
  end

  desc 'ENV for secrets'
  task :set_key_base do
    on roles(:app) do
      execute "export SECRET_KEY_BASE=337c936739854cf403faf831cf08f46a"
    end
  end
  before 'deploy:assets:precompile', 'deploy:set_key_base'  # 

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     invoke 'puma:restart'
  #   end
  # end

  # before :starting,     :check_revision
  # after  :finishing,    :compile_assets
  # after  :finishing,    :cleanup
  # after  :finishing,    :restart
end
before "rvm1:install:rvm", "app:update_rvm_key"




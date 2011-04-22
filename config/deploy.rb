set :application, "holiday_machine"
set :scm, :git
#set :domain, "thalamouse.com"
set :repository, "git://github.com/etskelly/#{application}.git"
set :scm_username, "etskelly"
set :user, "root"
#set :use_sudo, false
set :deploy_to, "/webapps/#{application}"

server "thalamouse.com", :app, :web, :db, :primary => true


#ssh_options[:forward_agent] = true
set :branch, "master"

set :deploy_via, :remote_cache


role :app, domain
role :web, domain
role :db, domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
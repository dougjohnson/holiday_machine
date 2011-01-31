set :application, "holiday_machine"
set :domain, "thalamouse.com"
#set :repository,  "ssh://#{domain}/path-to-your-git-repo/#{application}.git"
set :repository, "file:///home/eamon/Projects/#{application}.git/.git"
set :user, "root"
set :use_sudo, true
set :deploy_to, "/webapps/#{application}"
set :scm, :git

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
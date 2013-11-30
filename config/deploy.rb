require "bundler/capistrano"   #部署时运行bundle
set :user, 'ucdnews'            #存放web的用户名
set :domain, '192.241.218.141'        #服务器IP
set :application, 'ucdnews_app'    #项目文件名，既将会在user里面创建这个名字的文件夹
# adjust if you are using RVM, remove if you are not
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '2.0.0'
set :rvm_type, :user
# file paths
set :repository, "git@github.com:huyipeng/ucdnews_app.git"  #git所存在的地址，我存放在自己的服务器中
set :deploy_to, "/home/ucdnews/ucdnews_app"  #部署的地址
# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true
ssh_options[:forward_agent] = true  #forward_agent方式

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, "production"

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end
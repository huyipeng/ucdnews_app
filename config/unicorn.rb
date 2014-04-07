worker_processes 2

root = "/home/huyipeng/apps/ucdnewsapp/current"
working_directory root

listen "/tmp/unicorn.ucdnewsapp.sock", :backlog => 64          
timeout 30

pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"
  

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end
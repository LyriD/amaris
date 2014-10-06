worker_processes 16
working_directory "/usr/share/nginx/html/vertcomm/"

preload_app true

timeout 30

listen "/usr/share/nginx/html/vertcomm/tmp/sockets/unicorn.sock", :backlog => 64

pid "/usr/share/nginx/html/vertcomm/tmp/pids/unicorn.pid"

stderr_path "/usr/share/nginx/html/vertcomm/log/unicorn.stderr.log"
stdout_path "/usr/share/nginx/html/vertcomm/log/unicorn.stdout.log"

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
            ActiveRecord::Base.connection.disconnect!
            end
            
            after_fork do |server, worker|
                defined?(ActiveRecord::Base) and
                        ActiveRecord::Base.establish_connection
                        end

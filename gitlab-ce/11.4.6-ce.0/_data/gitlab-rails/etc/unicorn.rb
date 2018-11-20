# This file is managed by gitlab-ctl. Manual changes will be
# erased! To change the contents below, edit /etc/gitlab/gitlab.rb
# and run `sudo gitlab-ctl reconfigure`.


# What ports/sockets to listen on, and what options for them.
listen "127.0.0.1:8080", :tcp_nopush => true
listen "/var/opt/gitlab/gitlab-rails/sockets/gitlab.socket", :backlog => 1024

working_directory '/var/opt/gitlab/gitlab-rails/working'

# What the timeout for killing busy workers is, in seconds
timeout 60

# Whether the app should be pre-loaded
preload_app true

# How many worker processes
worker_processes 2

# What to do before we exec the binary
before_exec do |server|
        if ENV['prometheus_multiproc_dir']
        old_metrics = Dir[File.join(ENV['prometheus_multiproc_dir'], '*.db')]
        FileUtils.rm_rf(old_metrics)
      end

end

# What to do before we fork a worker
before_fork do |server, worker|
        old_pid = "#{server.config[:pid]}.oldbin"
      if old_pid != server.pid
        begin
          sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
          Process.kill(sig, File.read(old_pid).to_i)
        rescue Errno::ENOENT, Errno::ESRCH
        end
      end

      ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

end

# What to do after we fork a worker
after_fork do |server, worker|
        require 'rbtrace' if ENV['ENABLE_RBTRACE']

      ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
      defined?(::Prometheus::Client.reinitialize_on_pid_change) &&
        Prometheus::Client.reinitialize_on_pid_change
      defined?(Gitlab::Database::LoadBalancing) &&
        Gitlab::Database::LoadBalancing.start_service_discovery

end

# Where to drop a pidfile
pid '/opt/gitlab/var/unicorn/unicorn.pid'

# Where stderr gets logged
stderr_path '/var/log/gitlab/unicorn/unicorn_stderr.log'

# Where stdout gets logged
stdout_path '/var/log/gitlab/unicorn/unicorn_stdout.log'

# Min memory size (RSS) per worker
ENV['GITLAB_UNICORN_MEMORY_MIN'] = (400 * 1 << 20).to_s

# Max memory size (RSS) per worker
ENV['GITLAB_UNICORN_MEMORY_MAX'] = (650 * 1 << 20).to_s


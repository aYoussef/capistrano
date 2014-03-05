namespace :nginx do
	desc "Installs Nginx"
	task :install do
		on roles(:web) do
      sudo 'apt-get -y install nginx'
      template "nginx-unicorn.erb", "/tmp/nginx-conf"
      sudo "mv /tmp/nginx-conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      sudo "mkdir -p /var/www/"
      sudo "chown -R deployer:www-data /var/www/"
      sudo "service nginx restart"
		end
	end

	desc "Install Unicorn"
	task :unicorn do
		on roles(:web) do
			# sudo 'apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev'
			# sudo 'cd /tmp ; wget http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz ;
			# tar -xvzf ruby-2.0.0-p451.tar.gz ; cd ruby-2.0.0-p451/ ; ./configure --prefix=/usr/local ;
			# make ; make install'
			# sudo 'gem install unicorn'
			execute "mkdir -p ~/unicorn"
			execute "mkdir -p ~/unicorn/logs"
			execute "mkdir -p ~/unicorn/pid"
			template "unicorn.erb", "/tmp/unicorn-conf"
			execute "mv /tmp/unicorn-conf ~/unicorn/unicorn.conf"
		end
	end

	after 'nginx:install', 'nginx:unicorn'
end
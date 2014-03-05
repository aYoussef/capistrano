namespace :servers do
	desc "Setup all servers"
	task :setup do
		on roles(:all) do
			sudo "apt-get -y update"
			sudo "apt-get -y install git"
		end
	end
end
module App
	class Server < Sinatra::Base
		set :method_override, true
		enable :sessions
	end #server
end #module
module App
	class Server < Sinatra::Base
		set :method_override, true
		enable :sessions

	get "/" do
		@categories = Category.all
		erb :index
	end 

	get "/categories/:name" do
		erb :categories
	end
			
	# @song = Song.first

	# ERB: @song[""]

	end #server
end #module
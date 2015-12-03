module App
	class Server < Sinatra::Base
		set :method_override, true
		enable :sessions

	get "/" do
		@categories = Category.all
		erb :index
	end 

	get "/categories/:id" do
		@category = Category.find(params[:id])
		category= Category.find(params[:id])
		@songs = category.songs
		erb :categories
	end

	get "/users/new" do 
		erb :new_user
	end

	post "/users" do
       @user = User.create(name: params["name"], email: params["email"])
       redirect to "/"
    end

    get "/login" do
      erb :login
    end 
			
	# @song = Song.first

	# ERB: @song[""]

	end #server
end #module
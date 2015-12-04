module App
	class Server < Sinatra::Base
		set :method_override, true
		enable :sessions

	get "/" do
		@user = User.find(session[:user_id]) if session[:user_id]
		@categories = Category.all
		erb :index
	end 

	post "/sessions" do
      # Try to find user in DB
      user = User.find_by({name: params[:name]})
      if user
 		session[:user_id] = user.id
      	redirect to "/"
      else
        @message = "Incorrect username or password."
        redirect to "/login"
      end 
  	end

  	delete "/sessions" do
      session[:user_id] = nil
      redirect to "/" 
    end

	get "/categories/:id" do
		@category = Category.find(params[:id])
		category= Category.find(params[:id])
		@songs = @category.songs
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

    get "/songs/:id" do
    	@this_song = Song.find(params[:id])
    	@user_name = @this_song.user.name
    	@song = {song_title: @this_song.title, song_content: @this_song.content, author: @user_name}
    	erb :song
    end 
			
	# @song = Song.first

	# ERB: @song[""]

	end #server
end #module
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

    get "/songs/new" do
    	erb :new_song
    end

    get "/songs/:id" do
      @user = User.find(session[:user_id]) if session[:user_id]
    	renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
    	markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    	@song = Song.find(params[:id])
    	@song.title = markdown.render(@song.title)
      @song.content = markdown.render(@song.content)

    	erb :song
    end 
    	
    post "/songs" do
    	song = Song.create({title: params[:title], category_id: params[:category], user_id: session[:user_id], content: params[:content], date_created: DateTime.now})
    	redirect to "/songs/#{song.id}"
    end

    get "/songs" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @songs = Song.all
      erb :songs

    end 

    get "/songs/:id/edit" do
      @song = Song.find(params[:id])
      erb :edit_song
    end 

    post "/songs" do
      edit = Edit.create({user_id: session[:user_id], edit_content: params[:content], song_id: params[:song_id], date_edited: DateTime.now})
      redirect to "/songs/#{song.id}"
    end

	# @song = Song.first

	# ERB: @song[""]

	end #server
end #module
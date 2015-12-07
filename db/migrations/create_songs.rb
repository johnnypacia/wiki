require_relative "../config"

class CreateSongs <ActiveRedcord::Migration
	def up
		create_table :songs do |t|
			t.string(:title)
			t.datetime(:date_created)
			t.integer(:user_id)
			t.integer(:edit_id)
			t.integer(:category_id)
			t.string(:content)
		end 
	end

	def down
		drop_table :songs 
	end 
end 

CreateSongs.migrate(ARGV[0])

require_relative "../config"

class CreateEdits <ActiveRecord::Migration
	def up
		create_table :edits do |t|
			t.integer(:user_id)
			t.string(:edit_content)
			t.integer(:song_id)
			t.datetime(:date_edited)
		end
	end

	def down 
		drop_table :edits
	end
end #class

CreateEdits.migrate(ARGV[0])
require_relative "../config"

class CreateCategories < ActiveRecord::Migration
	def up
		create_table :categories do |t|
			t.string(:name)
		end
	end

	def down
		drop_table :categories
	end	
end # class

CreateCategories.migrate(ARGV[0])
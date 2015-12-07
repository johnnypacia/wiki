class Song < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :edits
	def last_version_date 
		if edits.last 
			edits.last.date_edited 
		else 
			date_created
		end 
	end 
end

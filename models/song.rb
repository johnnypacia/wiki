class Song < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :edits
	def last_version_date 
		if self.edits.last 
			self.edits.last.date_edited 
		else 
			self.date_created
		end 
	end 
end

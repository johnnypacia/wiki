class Editor < ActiveRecord::Base
	belongs_to :users
	has_many :articles
end
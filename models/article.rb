class Article < ActiveRecord::Base
	belongs_to :categories
	belongs_to :authors
	belongs_to :editors
end

class City < ActiveRecord::Base
	validates :name, presence: true
	def self.search_for(query)
		self.where('title LIKE :query OR category LIKE :query OR link LIKE :query', query: "%#{query}%")
	end
end
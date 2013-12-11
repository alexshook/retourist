class City < ActiveRecord::Base
	validates :name, presence: true
	def self.search_for(query)
		self.where('name LIKE :query', query: "%#{query}%")
	end
end
class City < ActiveRecord::Base
	belongs_to :users
	validates :name, presence: true

	City.joins(:users)
	def self.search_for(query)
		self.where('name LIKE :query', query: "%#{query}%")
	end
end
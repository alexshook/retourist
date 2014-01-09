class City < ActiveRecord::Base
	belongs_to :users
	validates :name, presence: true

	def self.search_for(query)
		City.joins(:users).where('name LIKE :query or user.first_name LIKE :query', query: "%#{query}%")
		# City.where('name LIKE :query').joins(:users).where('first_name LIKE :query OR last_name like :query', query: "%#{query}%")
	end
end
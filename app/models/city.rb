class City < ActiveRecord::Base
	has_many :users
	has_many :interests, through: :users
	validates :name, presence: true
	def self.search_for(query)
		self.where('name LIKE :query', query: "%#{query}%")
	end
end
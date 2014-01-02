class City < ActiveRecord::Base
	belongs_to :users
	has_many :interests, through: :users
	validates :name, presence: true
	def self.search_for(query)
		self.where('name LIKE :query', query: "%#{query}%")
	end
end
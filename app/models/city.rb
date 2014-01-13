class City < ActiveRecord::Base
	belongs_to :users
	validates :name, presence: true

	has_attached_file :photo, :styles => 
		{ :medium => "300x300>", :thumb => "100x100>" }

	def self.search_for(query)
		self.where('name LIKE :query or country LIKE :query', query: "%#{query}%")
		# City.where('name LIKE :query').joins(:users).where('first_name LIKE :query OR last_name like :query', query: "%#{query}%")
	end
end
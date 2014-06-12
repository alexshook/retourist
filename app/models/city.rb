class City < ActiveRecord::Base
	has_many :users
	validates :name, presence: true

	has_attached_file :photo, :styles =>
		{ :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "http://lorempixel.com/600/400/city"

	def self.search_for(query)
		self.where('name LIKE :query or country LIKE :query', query: "%#{query}%")
	end
end

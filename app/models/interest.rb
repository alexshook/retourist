class Interest < ActiveRecord::Base
	belongs_to :users
	has_many :cities, through: :users
end

class Interest < ActiveRecord::Base
	belongs_to :users
	has_one :city, through: :users
end

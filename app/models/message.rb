class Message < ActiveRecord::Base
	belongs_to :sender, source: "User"
	belongs_to :recipient, source: "User"
end

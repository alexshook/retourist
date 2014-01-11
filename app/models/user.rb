class User < ActiveRecord::Base
	has_one :city
	
	has_many :messages, foreign_key: "sender_id"
	has_many :sent_messages, through: :messages, source: :sender
	has_many :reverse_messages, foreign_key: "recipient_id", class_name: "Message"
	has_many :received_messages, through: :reverse_messages, source: :recipient

	has_attached_file :avatar, :styles => 
		{ :medium => "300x300>", 
			:thumb => "100x100>" }, 
		:default_url => "/images/:style/missing.png", 
		# :path => ":rails_root/public/system/:attachment/:id/:style/:filename", 
		# :url => "/system/:attachment/:id/:style/:filename"

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	def received?(other_user)
    	messages.find_by(recipient_id: other_user.id)
  	end

  	def send!(other_user)
    	messages.create!(recipient_id: other_user.id)
  	end


# sent_user_path	 GET	 /users/:id/sent(.:format)	 users#sent
# received_user_path	 GET	 /users/:id/received(.:format)	 users#received

end
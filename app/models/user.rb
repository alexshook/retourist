class User < ActiveRecord::Base
	belongs_to :city

	has_many :messages, foreign_key: "sender_id"
	has_many :sent_messages, through: :messages, source: :sender
	has_many :reverse_messages, foreign_key: "recipient_id", class_name: "Message"
	has_many :received_messages, through: :reverse_messages, source: :recipient

# Paperclip 3.0 introduces a non-backward compatible change in your attachment
# path. This will help to prevent attachment name clashes when you have
# multiple attachments with the same name. If you didn't alter your
# attachment's path and are using Paperclip's default, you'll have to add
# `:path` and `:url` to your `has_attached_file` definition. For example:

#     has_attached_file :avatar,
#       :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
#       :url => "/system/:attachment/:id/:style/:filename"

	has_attached_file :avatar, :styles =>
		{ :medium => "300x300>",
			:thumb => "100x100>" },
		 :default_url => "http://lorempixel.com/400/320/people/"
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

end

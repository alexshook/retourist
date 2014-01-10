class User < ActiveRecord::Base
	has_one :city
	has_many :messages, foreign_key: "sender_id"
	has_many :messages_sent, foreign_key: "recipient_id", class_name: "Message"
	# has_many :messages_sent, through: :messages, source: "sender_id"
	has_many :messages_received, through: :messages, source: "recipient_id"
	has_many :recipients, through: :messages_sent, source: "recipient"
	# has_many :messages, foreign_key: "sender_id"
	# has_many :messages_received, foreign_key: "recipient_id"
	# has_many :messages_sent, foreign_key: "sender_id"
	# has_many :messages_received, foreign_key: "recipient_id"
	has_attached_file :avatar, :styles => { :medium => "300x300>", 
		:thumb => "100x100>" }, 
		:default_url => "/images/:style/missing.png", 
		:path => ":rails_root/public/system/:attachment/:id/:style/:filename", 
		:url => "/system/:attachment/:id/:style/:filename"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def received(other_user)
  	messages.find_by(recipient_id: other_user.id)
  end

  def send!(other_user)
  	messages.create(recipient_id: other_user.id)
  end
end
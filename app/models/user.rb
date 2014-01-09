class User < ActiveRecord::Base
	has_one :city
	has_many :messages_sent, class_name: "User", primary_key: "user_id", foreign_key: "sender_id"
	has_many :messages_received, class_name: "User", primary_key: "user_id", foreign_key: "recipient_id"
	has_many :recipients, through: :messages_sent
	has_attached_file :avatar, :styles => { :medium => "300x300>", 
		:thumb => "100x100>" }, 
		:default_url => "/images/:style/missing.png", 
		:path => ":rails_root/public/system/:attachment/:id/:style/:filename", 
		:url => "/system/:attachment/:id/:style/:filename"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
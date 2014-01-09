class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@messages = Message.all
	if @messages.empty?
		flash[:notice] = "No Messages"
	end
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new message_params
  	@message.sender_id = @user_id
  	if @message.save
  		flash[:notice] = "Message sent!"
  		redirect_to @message
  	else
  		render :new
  	end
  end

  def show
  		@message = Message.find params[:id]
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :message_content)
  end
end